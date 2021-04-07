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
        // http://stackoverflow.com/questions/3925942/cllocation-category-for-calculating-bearing-w-haversine-function
        let lat1 = Double.pi * latOfBE / 180.0
        let long1 = Double.pi * lngOfBE / 180.0
        let lat2 = Double.pi * latOfPilot / 180.0
        let long2 = Double.pi * lngOfPilot / 180.0
        
        // Formula: θ = atan2( sin Δλ ⋅ cos φ2 , cos φ1 ⋅ sin φ2 − sin φ1 ⋅ cos φ2 ⋅ cos Δλ )
        // Source: http://www.movable-type.co.uk/scripts/latlong.html
        let rads = atan2(
            sin(long2 - long1) * cos(lat2),
            cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(long2 - long1))
        let degrees = rads * 180 / Double.pi
        
        let trueBearing = (degrees + 360).truncatingRemainder(dividingBy: 360)
        let declination = getBullseyeDeclination(latOfBE: latOfBE, lngOfBE: lngOfBE)
        // apply declination to trueBearing
        // declination is the opposite of variation
        // declination is positive when eastward and negative when westward
        let magBearingRaw:Double = (declination + trueBearing).rounded()
        var magBearing = Int(magBearingRaw)
        print("magVar before mod = \(magBearing)")
        // modulo 360 too keep it as a valid compass heading
        magBearing = mod(magBearing, 360)
        print("magVar after mod = \(magBearing)")
        return magBearing
    }
    
    // this function does an actual modulus, as opposed to
    // % which does not work for negative values!
    static func mod(_ a: Int, _ n: Int) -> Int {
        precondition(n > 0, "modulus must be positive")
        let r = a % n
        return r >= 0 ? r : r + n
    }
    
    static func getBullseyeDeclination(latOfBE: Double, lngOfBE: Double) -> Double {
        // get the declination at the bullseye point
        let gm = Geomagnetism(longitude: lngOfBE, latitude: latOfBE, date: Date())
        return gm.declination
    }
    
    static func degreesToRadians(_ number: Double) -> Double {
        return number * .pi / 180
    }
    static func radiansToDegrees(_ number: Double) -> Double {
        return number * 180 / .pi
    }
}
