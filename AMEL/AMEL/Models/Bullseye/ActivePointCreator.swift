//
//  ActivePointCreator.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/3/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
struct ActivePointCreator {
    var points: FetchedResults<ReferencePoint>
    let managedObjectContext: NSManagedObjectContext
    
    func getActivePoint()->ReferencePoint?{
        var activePoint: ReferencePoint?
        for savedPoint in self.points {
            if savedPoint.isActive {
                activePoint = savedPoint
            }
        }
        activePoint = setDefaultActivePoint(activePoint: activePoint)
        return activePoint
    }
    
    func setDefaultActivePoint(activePoint: ReferencePoint?)->ReferencePoint? {
        if activePoint == nil {
            setFirstAsActive()
            return self.points.first
        }
        else {
            return activePoint
        }
    }
    func setFirstAsActive() {
        if self.points.first != nil {
            self.points.first!.isActive = true
            savePoints()
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
