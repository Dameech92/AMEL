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
    @State var lat_error = false
    @State var lng_error = false
    @State var name_error = false
    @ObservedObject var pickerData = PickerData()
    let numberInputs = "-.0123456789"
    var body: some View {
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext)
        return VStack {
            HStack {
                Spacer()
                Button(action: {
                    if refAction.dataIsValid(lat: self.latitude, lng: self.longitude, name: self.BEName) {
                        refAction.recordReferencePoint(name: self.BEName)
                    }
                    self.lat_error = !refAction.latInRange(lat: self.latitude)
                    self.lng_error = !refAction.lngInRange(lng: self.longitude)
                    self.name_error = !refAction.nameIsValid(name: self.BEName)
                    refAction.resetPickers()
                    self.latitude = ""
                    self.longitude = ""
                    self.BEName = ""
                    
                }){
                    Text("Save")
                }
            }.padding(.trailing)
            Text("Reference Point:")
                .font(.title)
            TextField("Name", text: $BEName)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .multilineTextAlignment(.center)
               //.padding(.horizontal)
               .frame(width: 400)
                .overlay(self.name_error ? Text("Invalid name").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
            
            HStack {
                VStack {
                    Text("Latitude")
                        .font(.title)
                    TextField("Degrees", text: $latitude)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .onReceive(Just(latitude)) { newValue in
                                let filtered = newValue.filter { self.numberInputs.contains($0) }
                                if filtered != newValue {
                                    self.latitude = filtered
                                }
                                refAction.updateLatitudePicker(latitude: self.latitude)
                            }
                    .overlay(self.lat_error ? Text("Invalid Latitude").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
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
                            let filtered = newValue.filter { self.numberInputs.contains($0) }
                            if filtered != newValue {
                                self.longitude = filtered
                            }
                            refAction.updateLongitudePicker(longitude: self.longitude)
                        }
                        .overlay(self.lng_error ? Text("Invalid Longitude").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
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
