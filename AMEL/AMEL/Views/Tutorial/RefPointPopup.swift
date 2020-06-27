//
//  RefPointPopup.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/21/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct RefPointPopup: View {
    var body: some View {
        HStack {
            Text("This sections shows distance in nautical miles / heading to the active reference point")
               .padding()
            Image(systemName: "arrow.up.left")
                .padding()
        }.background(Color("Teal"))
        .cornerRadius(6)
       
    }
}

struct RefPointPopup_Previews: PreviewProvider {
    static var previews: some View {
        RefPointPopup()
    }
}
