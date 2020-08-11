//
//  ActiveRefPointVM.swift
//  AMEL
//
//  Created by Tristan Nibbe on 5/1/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

class ActiveRefPointVM : ReferencePointViewModelProtocol{
    
    var LocationVM = LocationViewModel()
    var currentActiveRefPoint: ReferencePoint?
    static let shared = ActiveRefPointVM()
    

    
    func executeFetchRequest(points: FetchedResults<ReferencePoint>){
        for savedPoint in points {
            if savedPoint.isActive {
                currentActiveRefPoint = savedPoint
            }
        }
    }
        
    func getFormatedReferencePointHeading() -> String {
        return String(format:"%.0f",getReferencePointHeading())
    }
    
    func getFormatedReferencePointDistance() -> String {
        return String(format:"%.0f", getReferencePointDistance())
    }
    
    func getReferencePointName() -> String {
        return currentActiveRefPoint?.name ?? "NoActiveRefPoint"
    }
    
    func getReferencePointHeading() -> Double {
        if(currentActiveRefPoint != nil){
            let pilotLat = LocationVM.getLatRaw()
            let pilotLong = LocationVM.getLongRaw()
            let RPLat = Double(truncating: currentActiveRefPoint?.latitude ?? 0)
            let RPLong = Double(truncating: currentActiveRefPoint?.longitude ?? 0)
            let headingDouble = RadialCoordinateCalculations.getAngle(latOfPilot: pilotLat, lngOfPilot: pilotLong, latOfBE: RPLat, lngOfBE: RPLong)
            return headingDouble
        }else{return 0}

    }
    
    func getReferencePointDistance() -> Double {
        if(currentActiveRefPoint != nil){
            let pilotLat = LocationVM.getLatRaw()
            let pilotLong = LocationVM.getLongRaw()

            let RPLat = Double(truncating: currentActiveRefPoint?.latitude ?? 0)
            let RPLong = Double(truncating: currentActiveRefPoint?.longitude ?? 0)
            var distance: Double = 0
            if RPLat != 0 && RPLong != 0{
                distance = RadialCoordinateCalculations.getDistance(latOfPilot: pilotLat, lngOfPilot: pilotLong, latOfBE: RPLat, lngOfBE: RPLong)
            }
            return distance
        }else{return 0}
    }
}
