//
//  PointSelector.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/26/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

struct PointSelector: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    let points: FetchedResults<ReferencePoint>
    @ObservedObject var pickerData: PickerData
    @ObservedObject var pointSetter: ActivePointSetter
    @ObservedObject var errors = SelectorError()
    
    var body: some View {
        let latFormatter = LatFormatter()
        let latUpdater = PickerUpdater(formatter: latFormatter, latlngData: self.pickerData.latPicker)
        let lngFormatter = LngFormatter()
        let lngUpdater = PickerUpdater(formatter: lngFormatter, latlngData: self.pickerData.lngPicker)
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext, activePointSetter: self.pointSetter)
        return VStack {
            SavePoint(selectorData: self.pointSetter.selectorData, errors: self.errors, refAction: refAction)
            Text("Reference Point:")
                .font(.title)
            TextField("Name", text: self.$pointSetter.selectorData.pointName)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .multilineTextAlignment(.center)
               .frame(width: 400)
                .overlay(self.errors.name_error ? Text("Invalid name").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
            
            HStack {
                VStack {
                    Text("Latitude")
                        .font(.title)
                    BullseyeTextField(data: self.$pointSetter.selectorData.latitude, error: self.$errors.lat_error, pickerUpdater: latUpdater)
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: geometry.size, directions: ["N","S"], degrees: Array(0...90))
                    }.frame(height: 100)
                        .clipped()
                }
                Spacer()
                VStack{
                    Text("Longitude")
                        .font(.title)
                    BullseyeTextField(data: self.$pointSetter.selectorData.longitude, error: self.$errors.lng_error, pickerUpdater: lngUpdater)
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: geometry.size, directions: ["E","W"], degrees: Array(0...180))
                    }.frame(height: 100)
                        .clipped()
                    
                }
            }
            
        }
    }
}
