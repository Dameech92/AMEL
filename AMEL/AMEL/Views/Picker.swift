//
//  PickerView.swift
//  AMEL
//
//  Created by MacOSCatalina on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI




struct PickerView: View {
    let size: CGSize
    @ObservedObject var pickerData: PickerData
    let latArray = Array(0...90)
    let lngArray = Array(0...180)
    let northSouthArray = ["N","S"]
    let eastWestArray = ["E","W"]
    var body: some View {
        return HStack() {
            Picker(selection: $pickerData.northSouthIndex, label: Text("")) {
                ForEach(0 ..< self.northSouthArray.count) {
                    Text(String(self.northSouthArray[$0])).tag($0)
                }
            }
            .frame(width: size.width / 4)
            
            Picker(selection: $pickerData.latIndex, label: Text("")) {
                ForEach(0 ..< self.latArray.count) {
                    Text(String(self.latArray[$0])).tag($0)
                }
            }
            .frame(width: size.width / 4)
            
            Picker(selection: $pickerData.eastWestIndex, label: Text("")) {
                ForEach(0 ..< self.eastWestArray.count) {
                    Text(String(self.eastWestArray[$0])).tag($0)
                }
            }
            .frame(width: size.width / 4)
            
            Picker(selection: $pickerData.lngIndex, label: Text("")) {
                ForEach(0 ..< self.lngArray.count) {
                    Text(String(self.lngArray[$0])).tag($0)
                }
                .frame(width: size.width / 4)
            }
        }
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(size: CGSize(width: 0, height: 0), pickerData: PickerData())
    }
}
