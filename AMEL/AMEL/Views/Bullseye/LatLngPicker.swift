//
//  LatPicker.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI

struct LatLngPicker: View {
    @ObservedObject var pickerData: LatLngData
    var directions: [String]
    let degrees: Array<Int>
    let minutes = Array(0...59)
    let minuteTenths = Array(0...9)
    let minPickerWidth = CGFloat(integerLiteral: 45)
    var body: some View {
        HStack{
            Picker(selection: $pickerData.direction, label: Text("")) {
                ForEach(0 ..< self.directions.count) { index in
                    Text(String(self.directions[index])).tag(index)
                }
            }
            .id(0)
            .frame(minWidth: 25, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            .clipped()
            Picker(selection: $pickerData.degree, label: Text("")) {
                ForEach(0 ..< self.degrees.count) { index in
                    Text(String(self.degrees[index])).tag(index)
                }
            }
            .id(0)
            .frame(minWidth: self.minPickerWidth, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            .clipped()
            Picker(selection: $pickerData.minute, label: Text("")) {
                ForEach(0 ..< self.minutes.count) { index in
                    Text(String(self.minutes[index])).tag(index)
                }
            }
            .frame(minWidth: self.minPickerWidth, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            .clipped()
            Picker(selection: $pickerData.minuteTenth, label: Text("")) {
                ForEach(0 ..< self.minuteTenths.count) { index in
                    Text(String(self.minuteTenths[index])).tag(index)
                }
            }
            .frame(minWidth: self.minPickerWidth, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            .clipped()
        }
    }
}

