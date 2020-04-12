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
    var color: Color?
    
    var body: some View {
        ZStack {
            Rectangle()
            .fill(self.color!)
            .frame(width: 180)
            .fixedSize(horizontal: true, vertical: false)
            
            Text(self.name!)
            .font(.title)
            .foregroundColor(Color.white)
        }
    }
}

struct EventTitleBackground_Previews: PreviewProvider {
    static var previews: some View {
        EventTitleBackground()
    }
}
