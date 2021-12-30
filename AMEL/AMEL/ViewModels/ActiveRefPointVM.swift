//
//  ActiveRefPointVM.swift
//  AMEL
//
//  Created by Tristan Nibbe on 5/1/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation
import SwiftUI

class ActiveRefPointVM : ReferencePointViewModelProtocol{
    
    //var LocationVM = LocationViewModel()
    @ObservedObject var activePoint: ActivePoint
    init(points:FetchedResults<ReferencePoint>){
        self.activePoint = ActivePoint(points: points)
    }
        
    func getFormatedReferencePointHeading(pLat: Double, pLong: Double) -> String {
        var display = "---°"
        let heading = self.getReferencePointHeading(pLat: pLat, pLong: pLong)
        if heading != nil {
            display = String(format: "%03d", Int(heading!)) + "°"
        }
        return display
    }
    
    func getFormatedReferencePointDistance(pLat: Double, pLong: Double) -> String {
        var display = "- nm"
        let distance = self.getReferencePointDistance(pLat: pLat, pLong: pLong)
        if distance != nil {
            display = String(format:"%.0f", distance!) + " nm"
        }
        return display
    }
    
    func getReferencePointName() -> String {
        return activePoint.point?.name ?? "NoActiveRefPoint"
    }
    
    func getReferencePointHeading(pLat: Double, pLong: Double) -> Int? {
        if(activePoint.point != nil){
            let pilotLat = pLat
            let pilotLong = pLong
            let RPLat = Double(truncating: activePoint.point?.latitude ?? 0)
            let RPLong = Double(truncating: activePoint.point?.longitude ?? 0)
            let heading = RadialCoordinateCalculations.referencePointBearing(latOfPilot: pilotLat, lngOfPilot: pilotLong, latOfBE: RPLat, lngOfBE: RPLong)
            return heading
        }else{return nil}

    }
    
    func getReferencePointDistance(pLat: Double, pLong: Double) -> Double? {
        if(activePoint.point != nil){
            let pilotLat = pLat
            let pilotLong = pLong
            
            let RPLat = Double(truncating: activePoint.point?.latitude ?? 0)
            let RPLong = Double(truncating: activePoint.point?.longitude ?? 0)
            
            let coordinate = CLLocation(latitude: pilotLat, longitude: pilotLong)
            let coordinate2 = CLLocation(latitude: RPLat, longitude: RPLong)
           
            var distance: Double = 0
            if RPLat != 0 && RPLong != 0{
                //distance = RadialCoordinateCalculations.getDistance(latOfPilot: pilotLat, lngOfPilot: pilotLong, latOfBE: RPLat, lngOfBE: RPLong)
                distance = (coordinate.distance(from: coordinate2) / 1852)
            }
            return distance
        }else{return nil}
    }
}
