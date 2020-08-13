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
    func getFormatedReferencePointHeading() -> String
    func getFormatedReferencePointDistance() -> String
    func getReferencePointName() -> String
    
    func getReferencePointHeading() -> Int?
    func getReferencePointDistance() -> Double?

}
