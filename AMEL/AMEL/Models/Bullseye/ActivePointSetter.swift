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
    var managedObjectContext: NSManagedObjectContext
    func setActivePoint(point: ReferencePoint) {
        for savedPoint in points {
            if savedPoint == point {
                savedPoint.isActive = true
            }
            else {
                savedPoint.isActive = false
            }
        }
    }
    func savePoints() {
        do {
            try self.managedObjectContext.save()
        } catch {
            print("Error saving")
        }
    }
}
