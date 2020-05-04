//
//  PickerData.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
class PickerData: ObservableObject {
    @Published var latPicker = LatLngData()
    @Published var lngPicker = LatLngData()
    
    func resetPickers() {
        self.latPicker.degree = 0
        self.latPicker.direction = 0
        self.latPicker.minute = 0
        self.latPicker.minuteTenth = 0
        self.lngPicker.degree = 0
        self.lngPicker.direction = 0
        self.lngPicker.minute = 0
        self.lngPicker.minuteTenth = 0
    }
    
}
class LatLngData: ObservableObject {
    @Published var direction = 0 
    @Published var degree = 0
    @Published var minute = 0
    @Published var minuteTenth = 0
    
}
