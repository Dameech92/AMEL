//
//  PointSelector.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/26/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import Combine

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
                Spacer()
                Button(action: {
                    refAction.recordReferencePoint(name: self.BEName)
                }){
                    Text("Save")
                }
            }.padding(.trailing)
            Text("Reference Point:")
                .font(.title)
            TextField("Name", text: $BEName)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .multilineTextAlignment(.center)
               .padding(.horizontal)
               .frame(width: 200)
           
            HStack {
                VStack {
                    Text("Latitude")
                        .font(.title)
                    TextField("Degrees", text: $latitude, onCommit: {
                        refAction.updateLatitudePicker(latitude: self.latitude)
                    })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .onReceive(Just(latitude)) { newValue in
                        let filtered = newValue.filter { ".0123456789".contains($0) }
                            if filtered != newValue {
                                self.latitude = filtered
                            }
                        }
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: geometry.size, directions: ["N","S"], degrees: Array(0...90))
                    }.frame(height: 100)
                        .clipped()
                }
                Spacer()
                VStack{
                    Text("Longitude")
                        .font(.title)
                    TextField("Degrees", text: $longitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .onReceive(Just(longitude)) { newValue in
                        let filtered = newValue.filter { ".0123456789".contains($0) }
                            if filtered != newValue {
                                self.longitude = filtered
                            }
                        }
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: geometry.size, directions: ["E","W"], degrees: Array(0...180))
                    }.frame(height: 100)
                        .clipped()
                    
                }
            }
            
        }.border(Color("stealthText"))
    }
}

struct PointSelector_Previews: PreviewProvider {
    static var previews: some View {
        PointSelector()
    }
}
