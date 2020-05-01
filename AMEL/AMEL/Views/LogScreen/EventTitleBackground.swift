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
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color(self.color!))
            
            Text(self.name!)
            .font(.title)
            .foregroundColor(Color.primary)
            .padding(5)
        }
        .lineLimit(1)
    }
}

struct EventTitleBackground_Previews: PreviewProvider {
    static var previews: some View {
        EventTitleBackground(name: "Test", color: "Red")
    }
}