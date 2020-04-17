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
    @Published var northSouthIndex = 0
    @Published var latIndex = 0
    @Published var eastWestIndex = 0
    @Published var lngIndex = 0
}
