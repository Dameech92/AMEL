//
//  DataFieldPopover.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/21/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct RecordOverlay: View {
    var body: some View {
        Text("Live Data Field")
        .padding()
        .background(Color("Teal").opacity(0.5))
        .cornerRadius(6)
       
    }
}

struct DataFieldPopover_Previews: PreviewProvider {
    static var previews: some View {
        RecordOverlay()
    }
}
