
//
//  LatPicker.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct LngPicker: View {
    @ObservedObject var pickerData: LatLngData
    let screenSize: CGSize
    let directions: [String]
    let degrees = Array(0...180)
    let minutes = Array(0...59)
    let minuteTenths = Array(0...9)
    let numPickers = CGFloat(integerLiteral: 8)
    var body: some View {
        HStack{
            Picker(selection: $pickerData.direction, label: Text("")) {
                ForEach(0 ..< self.directions.count) {
                    Text(String(self.directions[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.degree, label: Text("")) {
                ForEach(0 ..< self.degrees.count) {
                    Text(String(self.degrees[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.minute, label: Text("")) {
                ForEach(0 ..< self.minutes.count) {
                    Text(String(self.minutes[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.minuteTenth, label: Text("")) {
                ForEach(0 ..< self.minuteTenths.count) {
                    Text(String(self.minuteTenths[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
        }
    }
}

struct LngPicker_Previews: PreviewProvider {
    static var previews: some View {
        LngPicker(pickerData: LatLngData(), screenSize: CGSize(), directions: ["",""])
    }
}
