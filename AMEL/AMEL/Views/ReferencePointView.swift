//
//  ReferencePointView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ReferencePointView: View {
    let point: ReferencePoint
    var body: some View {
        let pointVM = RefPointViewModel(point: self.point)
        return HStack {
            Text(pointVM.getName())
            Text(pointVM.getNorthSouth())
            Text(pointVM.getLatitude())
            Text(pointVM.getEastWest())
            Text(pointVM.getLongitude())
        }
    }
}

struct ReferencePointView_Previews: PreviewProvider {
    static var previews: some View {
        ReferencePointView(point: ReferencePoint())
    }
}
