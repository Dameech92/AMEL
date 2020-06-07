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
    @Environment(\.verticalSizeClass) var heightSizeClass
    @Environment(\.horizontalSizeClass) var widthSizeClass
    private var name:String
    private var color:String
    init(name:String, color: String) {
        self.name = name
		self.color = color
    }
    var body: some View {
        let smallText = heightSizeClass == .compact || widthSizeClass == .compact
        return Button(action: {
            ButtonAction.record(self.name, self.color, self.locationManager, self.managedObjectContext)
			let newEvent:Event = ButtonAction.createEvent(self.managedObjectContext)
            ButtonAction.saveEvent(newEvent, self.name, self.color, self.managedObjectContext)
        }){
            VStack {
                Text(self.name)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 0, maxHeight: .infinity)
            .font(smallText ? .body : .largeTitle)
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
