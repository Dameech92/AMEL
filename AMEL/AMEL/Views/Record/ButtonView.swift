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
   
    public init(name: String, color: String){
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
            GeometryReader { g in
                VStack {
                    Text(self.name)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight: .infinity)
                .font(smallText ? .body : .largeTitle)
                .padding(10)
                .foregroundColor(.black)
                .background(Color(self.color))
                .cornerRadius(self.getRadius(size: g.size))
                .buttonStyle(CustomButtonStyle())
            }
        }
    }
    func getRadius(size: CGSize)->CGFloat {
        return sqrt(size.width * size.height) / 8
    }
}

struct IPhone_ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let numButtons = 6;
        return Group{
            //portrait
            HStack {
                VStack {
                    ForEach(0 ..< numButtons / 2) {_ in
                        ButtonView(name: "test", color: "Blue")
                    }
                }
                
                VStack {
                    ForEach(numButtons / 2 ..< numButtons) {_ in
                        ButtonView(name: "test", color: "Blue")
                   }
                }
                
            }.padding(2)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            VStack {
                HStack {
                    ForEach(0 ..< numButtons / 2) {_ in
                        ButtonView(name: "test", color: "Blue")
                    }
                }
                
                HStack {
                    ForEach(numButtons / 2 ..< numButtons) {_ in
                       ButtonView(name: "test", color: "Blue")
                   }
                }
                
            }.padding(2)
            .previewLayout(PreviewLayout.fixed(width: 812, height: 375))
            .previewDisplayName("Iphone 11 Landscape")
        }
        
    }
}

struct IPad_ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let numButtons = 6;
        return Group {
            HStack {
                VStack {
                    ForEach(0 ..< numButtons / 2) {_ in
                        ButtonView(name: "test", color: "Blue")
                    }
                }
                
                VStack {
                    ForEach(numButtons / 2 ..< numButtons) {_ in
                        ButtonView(name: "test", color: "Blue")
                   }
                }
                
            }.padding(2)
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"))
            .previewDisplayName("Ipad Pro 11-inch")
            HStack {
               VStack {
                   ForEach(0 ..< numButtons / 2) {_ in
                    ButtonView(name: "test", color: "Blue")
                   }
               }
               
               VStack {
                   ForEach(numButtons / 2 ..< numButtons) {_ in
                    ButtonView(name: "test", color: "Blue")
                  }
               }
                           
           }.padding(2)
            .previewLayout(PreviewLayout.fixed(width: 1024, height: 768))
            .previewDisplayName("IPad Pro 11 Landscape")
        }
    }
}
