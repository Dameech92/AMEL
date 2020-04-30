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
    var body: some View {
        let pointVM = RefPointViewModel(point: point)
        return HStack {
            Text(pointVM.getName())
            Text(pointVM.getLatLng())
        }
    }
}

struct ReferencePointView_Previews: PreviewProvider {
    static var previews: some View {
        RefPointView(point: ReferencePoint())
    }
}