//
//  PointListHeader.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/7/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct PointsHeader: View {
    var body: some View {
        HStack {
            Text("Saved Points")
            Spacer()
            ClearBullsEye()
        }
    }
}

struct PointListHeader_Previews: PreviewProvider {
    static var previews: some View {
        PointsHeader()
    }
}
