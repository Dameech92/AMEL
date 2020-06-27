//
//  ButtonExplanation.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/26/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ButtonExplanation: View {
    var body: some View {
        HStack {
            Text("Below are the event buttons. Try clicking one record an event")
            .padding()
            Image(systemName: "arrow.down")
            .padding()
        }
        .background(Color("Teal"))
        .cornerRadius(6)
    }
}

struct ButtonExplanation_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExplanation()
    }
}
