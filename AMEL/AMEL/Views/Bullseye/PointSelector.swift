//
//  PointSelector.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/26/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct PointSelector: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var BEName = ""
    @State var latitude = ""
    @State var longitude = ""
    @ObservedObject var pickerData = PickerData()
    var body: some View {
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext)
        return VStack {
            HStack {
                TextField("Enter B/E name", text: $BEName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                Button(action: {
                       refAction.recordReferencePoint(name: self.BEName)
                   }){
                       Text("Save")
                   }
                   .padding()
            }
            
            HStack {
                VStack {
                    Text("Latitude")
                        .font(.title)
                    TextField("DD", text: $latitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: geometry.size, directions: ["N","S"], degrees: Array(0...90))
                    }.frame(height: 100)
                        .clipped()
                }
                Spacer()
                VStack{
                    Text("Longitude")
                        .font(.title)
                    TextField("DD", text: $longitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: geometry.size, directions: ["E","W"], degrees: Array(0...180))
                    }.frame(height: 100)
                        .clipped()
                    
                }
            }
            
            
        }
    }
}

struct PointSelector_Previews: PreviewProvider {
    static var previews: some View {
        PointSelector()
    }
}
