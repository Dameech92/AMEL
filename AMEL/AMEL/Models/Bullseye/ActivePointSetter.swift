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
class ActivePointSetter: ObservableObject {
    var points: FetchedResults<ReferencePoint>
    let managedObjectContext: NSManagedObjectContext
    @Published var selectorData: SelectorData
    
    init(points: FetchedResults<ReferencePoint>, managedObjectContext: NSManagedObjectContext, selectorData: SelectorData){
        self.points = points
        self.managedObjectContext = managedObjectContext
        self.selectorData = selectorData
    }
   
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
    }
    func updatePointSelector(point: ReferencePoint, selectorData: SelectorData){
        let selectorUpdater = SelectorUpdater(selectorData: selectorData)
        selectorUpdater.updatePointSelector(point: point)
    }
    
    func savePoints() {
        do {
            try self.managedObjectContext.save()
        } catch {
            print("Error saving")
        }
    }
}
