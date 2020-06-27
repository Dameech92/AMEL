//
//  DataFieldPopover.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/21/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct LiveDataField: View {
    var body: some View {
        HStack {
            Text("This is the Live Data Field for real time information")
            .padding()
            Image(systemName: "arrow.down.left")
            .padding()
        }
        .background(Color("Teal"))
        .cornerRadius(6)
    }
}

struct RecordOverlay_Previews: PreviewProvider {
    static var previews: some View {
        LiveDataField()
    }
}
