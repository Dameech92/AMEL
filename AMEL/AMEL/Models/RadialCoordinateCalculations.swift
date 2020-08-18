//
//  RadialCoordinateCalculations.swift
//  AMEL
//
//  Created by MacOSCatalina on 5/3/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
public class RadialCoordinateCalculations {
    
    //Please Provide lat and lng in form of degrees.mmss and use - to indicate S or W for equation to work properly
    static func getDistance(latOfPilot: Double, lngOfPilot: Double, latOfBE: Double, lngOfBE: Double) -> Double {
        //Answer outputs in nm by divinding by 1.852
        //also 6371 is earths radius in km
        return (acos(sin(latOfPilot) * sin(latOfBE) + cos(latOfPilot) * cos(latOfBE) * cos(lngOfBE - lngOfPilot)) * 6371)/1.852
    }
    
    static func referencePointBearing(latOfPilot: Double, lngOfPilot: Double, latOfBE: Double, lngOfBE: Double) -> Int {
        // returns the bearing from the reference point to the pilot
        
        let fromLat = degreesToRadians(latOfBE)
        let fromLon = degreesToRadians(lngOfBE)
        let toLat = degreesToRadians(latOfPilot)
        let toLon = degreesToRadians(lngOfPilot)
        
        let y = sin(fromLon - toLon) * cos(fromLat)
        let x = cos(toLat) * sin(fromLat) - sin(toLat) * cos(fromLat) * cos(fromLon - toLon)
        var rawBearing = radiansToDegrees( atan2(y, x))
        
        rawBearing = (rawBearing + 180.0).truncatingRemainder(dividingBy: 360.0)
        
        return Int(abs(rawBearing))
    }
    static func degreesToRadians(_ number: Double) -> Double {
        return number * .pi / 180
    }
    static func radiansToDegrees(_ number: Double) -> Double {
        return number * 180 / .pi
    }
}
