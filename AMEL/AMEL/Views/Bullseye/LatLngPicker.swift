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
    let screenSize: CGSize
    var directions: [String]
    let degrees: Array<Int>
    let minutes = Array(0...59)
    let minuteTenths = Array(0...9)
    let numPickers = CGFloat(integerLiteral: 4)
    var body: some View {
        HStack{
            Picker(selection: $pickerData.direction, label: Text("")) {
                ForEach(0 ..< self.directions.count) { index in
                    Text(String(self.directions[index])).tag(index)
                }
            }
            .id(0)
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.degree, label: Text("")) {
                ForEach(0 ..< self.degrees.count) { index in
                    Text(String(self.degrees[index])).tag(index)
                }
            }
            .id(0)
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.minute, label: Text("")) {
                ForEach(0 ..< self.minutes.count) { index in
                    Text(String(self.minutes[index])).tag(index)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.minuteTenth, label: Text("")) {
                ForEach(0 ..< self.minuteTenths.count) { index in
                    Text(String(self.minuteTenths[index])).tag(index)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
        }
    }
}

