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
    
    func getActivePoint()->ReferencePoint?{
        var activePoint: ReferencePoint?
        for savedPoint in self.points {
            if savedPoint.isActive {
                activePoint = savedPoint
            }
        }
        return activePoint
    }

}
