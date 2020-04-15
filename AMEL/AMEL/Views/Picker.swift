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
    
    @State private var startingIndex1 = 0
    @State private var startingIndex2 = 0
    @State private var startingIndex3 = 0
    @State private var startingIndex4 = 0
    let latArray = Array(0...90)
    let lngArray = Array(0...180)
    
    
    var body: some View {
        HStack() {
            Picker(selection: self.$startingIndex1, label: Text("")) {
                Text("N")
                Text("S")
            }
            .frame(width: size.width / 4)
            
            Picker(selection: self.$startingIndex2, label: Text("")) {
                ForEach(0 ..< self.latArray.count) {
                    Text(String(self.latArray[$0])).tag($0)
                }
            }
            .frame(width: size.width / 4)
            
            Picker(selection: self.$startingIndex3, label: Text("")) {
                Text("E")
                Text("W")
            }
            .frame(width: size.width / 4)
            
            Picker(selection: self.$startingIndex4, label: Text("")) {
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
        PickerView(size: CGSize(width: 0, height: 0))
    }
}
