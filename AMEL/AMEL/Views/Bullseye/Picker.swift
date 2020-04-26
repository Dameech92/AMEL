//
//  PickerView.swift
//  AMEL
//
//  Created by MacOSCatalina on self.numPickers/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI




struct PickerView: View {
    let size: CGSize
    @ObservedObject var pickerData: PickerData
    var body: some View {
        let pickerSize = CGSize(width: self.size.width / 2, height: self.size.height)
        return HStack {
            LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: pickerSize, directions: ["N","S"], degrees: Array(0...90))
            Spacer()
            LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: pickerSize, directions: ["E","W"], degrees: Array(0...180))
        }
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(size: CGSize(width: 0, height: 0), pickerData: PickerData())
    }
}