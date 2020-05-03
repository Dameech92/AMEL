//
//  ActivePointSetter.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
struct ActivePointSetter {
    var points: FetchedResults<ReferencePoint>
    let managedObjectContext: NSManagedObjectContext
    @ObservedObject var selectorData: SelectorData
   
    func setActivePoint(point: ReferencePoint) {
        for savedPoint in points {
            if savedPoint == point {
                savedPoint.isActive = true
            }
            else {
                savedPoint.isActive = false
            }
        }
        savePoints()
        updatePointSelector(point: point)
    }
    
    func savePoints() {
        do {
            try self.managedObjectContext.save()
        } catch {
            print("Error saving")
        }
    }
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
