//
//  ColorDetail.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ColorDetail: View {
    let color: String
    var body: some View {
        HStack {
            Text(self.color)
            Spacer()
            Rectangle()
                .fill(Color(self.color))
                .frame(width:40, height: 40)
                .cornerRadius(5)
        }
    }
}

struct ColorDetail_Previews: PreviewProvider {
    static var previews: some View {
        ColorDetail(color: "Red")
    }
}
