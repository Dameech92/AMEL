//
//  ReferencePointView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import Foundation
import SwiftUI

struct RefPointView: View {
    let point: ReferencePoint
    let activePoint: ActivePointSetter
    var body: some View {
        let pointVM = RefPointViewModel(point: point)
        return HStack {
            if point.isActive {
                Image(systemName: "circle.fill")
            } else {
                Image(systemName: "circle")
            }
            Text(pointVM.getName())
            Text(pointVM.getLatLng())
        }.onTapGesture {
            self.activePoint.setActivePoint(point: self.point)
            self.activePoint.updatePointSelector(point: self.point)
        }
    }
}
