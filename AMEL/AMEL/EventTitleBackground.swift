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
        ZStack{
            
            RoundedRectangle(cornerRadius: 0)
                .fill(color!)

        
            Text(name!)
                .font(.title)
                .foregroundColor(Color.white)
                .fixedSize()
        }


    }
}

struct EventTitleBackground_Previews: PreviewProvider {
    static var previews: some View {
        EventTitleBackground()
    }
}
