//
//  ActiveRefPointVM.swift
//  AMEL
//
//  Created by Tristan Nibbe on 5/1/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct ActiveRefPointVM : ReferencePointViewModelProtocol{        
    func getFormatedReferencePointHeading() -> String {
        return "125"
    }
    
    func getFormatedReferencePointDistance() -> String {
        return "30"
    }
    
    func getReferencePointName() -> String {
        return "rock125"
    }
    
    func getReferencePointHeading() -> Double {
        return 125
    }
    
    func getReferencePointDistance() -> Double {
        return 30
    }
}
