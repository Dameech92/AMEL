//
//  SelectorUpdater.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/3/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
struct SelectorUpdater {
    let selectorData: SelectorData
    func updatePointSelector(point: ReferencePoint?) {
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = false
        formatter.minimumFractionDigits = 0 // default
        formatter.maximumFractionDigits = 5 // default
        if point != nil {
            if point!.latitude != nil {
                let latFormatted = formatter.string(from: point!.latitude!)
                self.selectorData.latitude = latFormatted ?? ""
            }
            if point!.longitude != nil {
                let lngFormatted = formatter.string(from: point!.longitude!)
                self.selectorData.longitude = lngFormatted ?? ""
            }
            self.selectorData.pointName = point!.name ?? ""
        }
    }
}
