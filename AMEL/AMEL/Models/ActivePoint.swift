//
//  ActivePoint.swift
//  AMEL
//
//  Created by Neil Marcellini on 8/13/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
class ActivePoint: ObservableObject {
    var points: FetchedResults<ReferencePoint>
    @Published var point: ReferencePoint?
    init(points: FetchedResults<ReferencePoint>){
        self.points = points
        self.point = nil
        for point in points {
            if point.isActive {
                self.point = point
                break
            }
        }
    }
}
