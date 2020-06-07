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
    @Environment(\.verticalSizeClass) var heightSizeClass
    @Environment(\.horizontalSizeClass) var widthSizeClass
    let points: FetchedResults<ReferencePoint>
    @ObservedObject var pickerData: PickerData
    @ObservedObject var pointSetter: ActivePointSetter
    @ObservedObject var errors = SelectorError()
    
    var body: some View {
        let latFormatter = LatFormatter()
        let latUpdater = PickerUpdater(formatter: latFormatter, latlngData: self.pickerData.latPicker)
        let lngFormatter = LngFormatter()
        let lngUpdater = PickerUpdater(formatter: lngFormatter, latlngData: self.pickerData.lngPicker)
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext, errors: self.errors, activePointSetter: self.pointSetter)
        let latDegrees = Array(0...90)
        let lngDegrees = Array(0...180)
        let latDirs = ["N", "S"]
        let lngDirs = ["E", "W"]
        let smallText = heightSizeClass == .compact
        return VStack {
            if smallText {
                HStack {
                    SaveChanges(selectorData: self.pointSetter.selectorData, errors: self.errors, refAction: refAction)
                    Spacer()
                    Text("Reference Point:")
                    Spacer()
                    SaveNewPoint(selectorData: self.pointSetter.selectorData, errors: self.errors, refAction: refAction)
                }
            } else {
                HStack {
                    SaveChanges(selectorData: self.pointSetter.selectorData, errors: self.errors, refAction: refAction)
                    Spacer()
                    Spacer()
                    SaveNewPoint(selectorData: self.pointSetter.selectorData, errors: self.errors, refAction: refAction)
                }.font({widthSizeClass == .compact}() ? .body : .title)
                Text("Reference Point:")
            }
            
            
            TextField("Name", text: self.$pointSetter.selectorData.pointName)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .multilineTextAlignment(.center)
               .frame(width: 400)
                .overlay(self.errors.name_error ? Text("Invalid name").foregroundColor(Color.red).padding() : nil, alignment: .trailing)
            
            HStack {
                if smallText {
                    Text("Lat")
                    BullseyeTextField(data: self.$pointSetter.selectorData.latitude, error: self.$errors.lat_error, pickerUpdater: latUpdater)
                        .frame(width: 80 )
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: geometry.size, directions: latDirs, degrees: latDegrees)
                    }.frame(height: 100)
                        .clipped()
                    Spacer()
                    Text("Lng")
                    BullseyeTextField(data: self.$pointSetter.selectorData.longitude, error: self.$errors.lng_error, pickerUpdater: lngUpdater)
                        .frame(width: 80 )
                    GeometryReader { geometry in
                        LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: geometry.size, directions: lngDirs, degrees: lngDegrees)
                    }.frame(height: 100)
                        .clipped()
                } else {
                    VStack {
                        Text("Latitude")
                        BullseyeTextField(data: self.$pointSetter.selectorData.latitude, error: self.$errors.lat_error, pickerUpdater: latUpdater)
                        GeometryReader { geometry in
                            LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: geometry.size, directions: latDirs, degrees: latDegrees)
                        }.frame(height: 100)
                            .clipped()
                    }
                    Spacer()
                    VStack{
                        Text("Longitude")
                        BullseyeTextField(data: self.$pointSetter.selectorData.longitude, error: self.$errors.lng_error, pickerUpdater: lngUpdater)
                        GeometryReader { geometry in
                            LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: geometry.size, directions: lngDirs, degrees: lngDegrees)
                        }.frame(height: 100)
                            .clipped()
                        
                    }
                }
                
            }
        }.font(smallText ? .body : .title)
    }
}
