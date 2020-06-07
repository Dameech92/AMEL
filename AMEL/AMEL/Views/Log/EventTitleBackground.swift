//
//  EventTitleBackground.swift
//  AMEL
//
//  Created by Nibbe, Tristan on 3/6/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct EventTitleBackground: View {
    var name: String?
    var color: String?
    let smallText: Bool
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color(self.color!))
            
            Text(self.name!)
                .font(self.smallText ? .subheadline : .title)
            .foregroundColor(Color.black)
            .padding(5)
        }
        .lineLimit(1)
    }
}

struct EventTitleBackground_Previews: PreviewProvider {
    static var previews: some View {
        EventTitleBackground(name: "Test", color: "Red", smallText: false)
    }
}
