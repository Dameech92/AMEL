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
    
    //Note this is not tested so I might need to change to lngOfPilot - lngOfBE instead of how it is currently
    static func getAngle(latOfPilot: Double, lngOfPilot: Double, latOfBE: Double, lngOfBE: Double) -> Double {
        //let step1 = sin(lngOfBE - lngOfPilot)*cos(latOfBE) * cos(latOfPilot) * sin(latOfBE)
        //let step2 = sin(latOfPilot) * cos(latOfBE) * cos(lngOfBE - lngOfPilot)
        //let step3 = atan(step1 - step2)
        //return step3
        return atan((sin(lngOfBE - lngOfPilot)*cos(latOfBE) * cos(latOfPilot) * sin(latOfBE)) - (sin(latOfPilot) * cos(latOfBE) * cos(lngOfBE - lngOfPilot))) * 1000
    }
}
