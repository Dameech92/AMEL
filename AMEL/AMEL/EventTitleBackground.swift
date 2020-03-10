//
//  EventTitleBackground.swift
//  AMEL
//
//  Created by Nibbe, Tristan on 3/6/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct EventTitleBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color.blue)
            .frame(height: 100)
    }
}

struct EventTitleBackground_Previews: PreviewProvider {
    static var previews: some View {
        EventTitleBackground()
    }
}
