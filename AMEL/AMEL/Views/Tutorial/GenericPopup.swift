//
//  GenericPopup.swift
//  AMEL
//
//  Created by Neil Marcellini on 7/16/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct GenericPopup: View {
    let text: String
    let symbolName: String
    var body: some View {
        HStack {
            Image(systemName: self.symbolName)
            .padding()
            Text(self.text)
               .padding()
                .lineLimit(nil)
        }.background(Color("Teal"))
        .cornerRadius(6)
    }
}

struct GenericPopup_Previews: PreviewProvider {
    static var previews: some View {
        GenericPopup(text: "Test", symbolName: "arrow.up")
    }
}
