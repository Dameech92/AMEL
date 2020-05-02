//
//  ReferencePointView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct RefPointView: View {
    let point: ReferencePoint
    let setter: ActivePointSetter
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
            self.setter.setActivePoint(point: self.point)
        }
    }
}
