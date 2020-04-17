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
        return HStack(spacing: 0) {
            LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: self.size, directions: ["N","S"])
            LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: self.size, directions: ["E","W"])
        }
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(size: CGSize(width: 0, height: 0), pickerData: PickerData())
    }
}
