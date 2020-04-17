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
}
class LatLngData: ObservableObject {
    @Published var direction = 0
    @Published var degree = 0
    @Published var minute = 0
    @Published var minuteTenth = 0
}
