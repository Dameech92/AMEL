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
    func getDistance(latOfPilot: Double, lngOfPilot: Double, latOfBE: Double, lngOfBE: Double) -> Double {
        //Answer outputs in nm by divinding by 1.852
        //also 6371 is earths radius in km
        return (acos(sin(latOfPilot) * sin(latOfBE) + cos(latOfPilot) * cos(latOfBE) * cos(lngOfBE - lngOfPilot)) * 6371)/1.852
    }
    
    //Note this is not tested so I might need to change to lngOfPilot - lngOfBE instead of how it is currently
    func getAngle(latOfPilot: Double, lngOfPilot: Double, latOfBE: Double, lngOfBE: Double) -> Double {
        return atan((sin(lngOfBE - lngOfPilot)*cos(latOfBE) * cos(latOfPilot) * sin(latOfBE)) - (sin(latOfPilot) * cos(latOfBE) * cos(lngOfBE - lngOfPilot)))
    }
}
