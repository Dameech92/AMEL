//
//  ButtonView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/9/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI
import UIKit

func displayToast(controller: UIViewController, message: String, seconds: Double){
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15
    controller.present(alert, animated: true)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds){
        alert.dismiss(animated: true)
    }
}

struct ButtonView: View {
    @ObservedObject private var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    private var name:String
    private var color:UIColor
    init(name:String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
    var body: some View {
        Button(action: {
			ButtonAction.record(self.name, self.color, self.locationManager, self.managedObjectContext)
			let newEvent:Event = ButtonAction.createEvent(self.managedObjectContext)
            if(ButtonAction.saveEvent(newEvent, self.name, self.color, self.managedObjectContext)){
                let cont = UIViewController()
                displayToast(controller: cont, message: "Event Recorded!", seconds: 3)
            }
        }){
            Text(self.name)
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 0, maxHeight: .infinity)
            .font(.largeTitle)
            .padding(10)
            .foregroundColor(.primary)
            .background(Color(self.color))
            .cornerRadius(40)
            
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(name: "test", color: UIColor.blue)
    }
}
