//
//  PickerFormatter.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct PickerFormatter {
     let pickerData: PickerData
    func getNorthSouth()->String {
        if pickerData.northSouthIndex == 0 {
            return "N"
        }
        else {
            return "S"
        }
    }
    func getEastWest()->String {
        if pickerData.eastWestIndex == 0 {
            return "E"
        }
        else {
            return "W"
        }
    }
}
