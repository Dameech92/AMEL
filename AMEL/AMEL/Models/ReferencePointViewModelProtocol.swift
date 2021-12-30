//
//
//  ReferencePointViewModelProtocol.swift
//  AMEL
//
//  Created by Tristan Nibbe on 4/29/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

public protocol ReferencePointViewModelProtocol{
    func getFormatedReferencePointHeading(pLat: Double, pLong: Double) -> String
    func getFormatedReferencePointDistance(pLat: Double, pLong: Double) -> String
    func getReferencePointName() -> String
    
    func getReferencePointHeading(pLat: Double, pLong: Double) -> Int?
    func getReferencePointDistance(pLat: Double, pLong: Double) -> Double?

}
