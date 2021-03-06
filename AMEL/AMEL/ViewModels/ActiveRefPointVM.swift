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
    @ObservedObject var activePoint: ActivePoint
    init(points:FetchedResults<ReferencePoint>){
        self.activePoint = ActivePoint(points: points)
    }
        
    func getFormatedReferencePointHeading() -> String {
        var display = "---°"
        let heading = self.getReferencePointHeading()
        if heading != nil {
            display = String(format: "%03d", Int(heading!)) + "°"
        }
        return display
    }
    
    func getFormatedReferencePointDistance() -> String {
        var display = "- nm"
        let distance = self.getReferencePointDistance()
        if distance != nil {
            display = String(format:"%.0f", distance!) + " nm"
        }
        return display
    }
    
    func getReferencePointName() -> String {
        return activePoint.point?.name ?? "NoActiveRefPoint"
    }
    
    func getReferencePointHeading() -> Int? {
        if(activePoint.point != nil){
            let pilotLat = LocationVM.getLatRaw()
            let pilotLong = LocationVM.getLongRaw()
            let RPLat = Double(truncating: activePoint.point?.latitude ?? 0)
            let RPLong = Double(truncating: activePoint.point?.longitude ?? 0)
            let heading = RadialCoordinateCalculations.referencePointBearing(latOfPilot: pilotLat, lngOfPilot: pilotLong, latOfBE: RPLat, lngOfBE: RPLong)
            return heading
        }else{return nil}

    }
    
    func getReferencePointDistance() -> Double? {
        if(activePoint.point != nil){
            let pilotLat = LocationVM.getLatRaw()
            let pilotLong = LocationVM.getLongRaw()

            let RPLat = Double(truncating: activePoint.point?.latitude ?? 0)
            let RPLong = Double(truncating: activePoint.point?.longitude ?? 0)
            var distance: Double = 0
            if RPLat != 0 && RPLong != 0{
                distance = RadialCoordinateCalculations.getDistance(latOfPilot: pilotLat, lngOfPilot: pilotLong, latOfBE: RPLat, lngOfBE: RPLong)
            }
            return distance
        }else{return nil}
    }
}
