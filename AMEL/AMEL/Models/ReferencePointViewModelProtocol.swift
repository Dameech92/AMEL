//
//  ReferencePointViewModelProtocol.swift
//  AMEL
//
//  Created by Tristan Nibbe on 4/29/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

public protocol ReferencePointViewModelProtocol{
    func getFormatedReferencPointHeading() -> String
    func getFormatedReferencePointDistance() -> String
    func getReferencePointName() -> String
    
    func getReferencePointHeading() -> Double
    func getReferencePointDistance() -> Double

}
