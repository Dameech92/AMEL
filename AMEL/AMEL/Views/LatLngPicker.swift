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
    let pickerArrays: PickerArrays
    let numPickers = CGFloat(integerLiteral: 8)
    var body: some View {
        HStack{
            Picker(selection: $pickerData.direction, label: Text("")) {
                ForEach(0 ..< pickerArrays.directions.count - 1) {
                    Text(String(self.pickerArrays.directions[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.degree, label: Text("")) {
                ForEach(0 ..< pickerArrays.degrees.count) {
                    Text(String(self.pickerArrays.degrees[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.minute, label: Text("")) {
                ForEach(0 ..< pickerArrays.minutes.count) {
                    Text(String(self.pickerArrays.minutes[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
            Picker(selection: $pickerData.minuteTenth, label: Text("")) {
                ForEach(0 ..< pickerArrays.minuteTenths.count) {
                    Text(String(self.pickerArrays.minuteTenths[$0])).tag($0)
                }
            }
            .frame(width: self.screenSize.width / self.numPickers)
            .clipped()
        }
    }
}

struct LatLngPicker_Previews: PreviewProvider {
    static var previews: some View {
        LatLngPicker(pickerData: LatLngData(), screenSize: CGSize(), pickerArrays: PickerArrays(isLatitude: true)  )
    }
}
