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
    @State private var buttonText = ""
    
    private var name:String
    private var color:String
    init(name:String, color: String) {
        self.name = name
		self.color = color
    }
    
    //This code is here if we decide we want to put the toast back in
    //var timer = Timer.publish(every: 3, on: .current, in: .common).autoconnect()
    
    var body: some View {
        Button(action: {
            ButtonAction.record(self.name, self.color, self.locationManager, self.managedObjectContext)
			let newEvent:Event = ButtonAction.createEvent(self.managedObjectContext)
            ButtonAction.saveEvent(newEvent, self.name, self.color, self.managedObjectContext)
            //This code is here if we decide we want to put the toast back in
            //if(ButtonAction.saveEvent(newEvent, self.name, self.color, self.managedObjectContext)){
                //self.buttonText = "Event Recorded"
            //} else {
                //self.buttonText = ""
            //}
        }){
            VStack {
                Text(self.name)
                //This code is here if we decide we want to put the toast back in
                //Text(self.buttonText)
                //.onReceive(timer){_ in
                    //self.buttonText = ""
                //}
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 0, maxHeight: .infinity)
            .font(.largeTitle)
            .padding(10)
            .foregroundColor(.black)
            .background(Color(self.color))
            .cornerRadius(40)
		}.buttonStyle(CustomButtonStyle())
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(name: "test", color: "Blue")
    }
}
