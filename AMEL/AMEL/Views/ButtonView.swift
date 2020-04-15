//
//  ButtonView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/9/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

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
			ButtonAction.record(self.locationManager)
			let newEvent:Event = ButtonAction.createEvent(self.managedObjectContext)
			ButtonAction.logEvent(newEvent, self.name, self.color, self.managedObjectContext)
		}) {
//			CustomButton(self.name, self.color)
//				.frame(minWidth: 0, maxWidth: .infinity)
//				.frame(minHeight: 0, maxHeight:.infinity)
//				.font(.largeTitle)
//				.padding(10)
//				.foregroundColor(.primary).cornerRadius(40)
			
            Text(self.name)
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 0, maxHeight: .infinity)
            .font(.largeTitle)
            .padding(10)
            .foregroundColor(.primary)
                .background(Color(self.color))
            .cornerRadius(40)
//            .padding(20)
//            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray,lineWidth: 6))
            
        }.padding()
    }
	
	public mutating func changeButtonName(_ newName:String) {
		self.name = newName
	}
	
	public mutating func changeButtonColor(_ newColor:UIColor) {
		self.color = newColor
	}
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(name: "test", color: UIColor.blue)
    }
}
