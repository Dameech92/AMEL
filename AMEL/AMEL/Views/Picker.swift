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
        let latArrays = PickerArrays(isLatitude: true)
        let lngArrays = PickerArrays(isLatitude: false)
        return HStack(spacing: 0) {
            LatLngPicker(pickerData: self.pickerData.latPicker, screenSize: self.size, pickerArrays: latArrays)
            LatLngPicker(pickerData: self.pickerData.lngPicker, screenSize: self.size, pickerArrays: lngArrays )
        }
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(size: CGSize(width: 0, height: 0), pickerData: PickerData())
    }
}
