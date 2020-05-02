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
    @ObservedObject var selectorData = SelectorData()
    @ObservedObject var pickerData = PickerData()
    let numberInputs = "-.0123456789"
    var body: some View {
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext)
        return VStack {
            SavePoint(selectorData: self.selectorData, refAction: refAction)
            Text("Reference Point:")
                .font(.title)
            TextField("Name", text: self.$selectorData.pointName)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .multilineTextAlignment(.center)
               .frame(width: 400)
                .overlay(self.selectorData.errors.name_error ? Text("Invalid name").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
            
            HStack {
                VStack {
                    Text("Latitude")
                        .font(.title)
                    TextField("Degrees", text: self.$selectorData.latitude)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .onReceive(Just(selectorData.latitude)) { newValue in
                                let filtered = newValue.filter { self.numberInputs.contains($0) }
                                if filtered != newValue {
                                    self.selectorData.latitude = filtered
                                }
                                refAction.updateLatitudePicker(latitude: self.selectorData.latitude)
                            }
                    .overlay(self.selectorData.errors.lat_error ? Text("Invalid Latitude").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: geometry.size, directions: ["N","S"], degrees: Array(0...90))
                    }.frame(height: 100)
                        .clipped()
                }
                Spacer()
                VStack{
                    Text("Longitude")
                        .font(.title)
                    TextField("Degrees", text: self.$selectorData.longitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .onReceive(Just(selectorData.longitude)) { newValue in
                            let filtered = newValue.filter { self.numberInputs.contains($0) }
                            if filtered != newValue {
                                self.selectorData.longitude = filtered
                            }
                            refAction.updateLongitudePicker(longitude: self.selectorData.longitude)
                        }
                        .overlay(self.selectorData.errors.lng_error ? Text("Invalid Longitude").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: geometry.size, directions: ["E","W"], degrees: Array(0...180))
                    }.frame(height: 100)
                        .clipped()
                    
                }
            }
            
        }
    }
}
extension PointSelector {
    
}

struct PointSelector_Previews: PreviewProvider {
    static var previews: some View {
        PointSelector()
    }
}
