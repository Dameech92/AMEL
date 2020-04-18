//
//  PickerArrays.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
class PickerArrays {
    let directions: [String]
    let degrees: [Int]
    let minutes = Array(0...59)
    let minuteTenths = Array(0...9)
    init(isLatitude: Bool) {
        if isLatitude {
            self.directions = ["N","S"]
            self.degrees = Array(0...90)
        }
        else{
            self.directions = ["E","W"]
            self.degrees = Array(0...180)
        }
    }
}
