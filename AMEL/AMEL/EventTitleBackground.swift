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
    
    var body: some View {
        ZStack{
            
            //RoundedRectangle(cornerRadius: 0)
               // .fill(Color.blue)

        
            Text(name!)
                .font(.title)
                .foregroundColor(Color.white)
                .fixedSize()
                //.background(Color.blue)
        }
        //.frame(minWidth:0,maxWidth: .infinity,minHeight:0 , maxHeight: .infinity)


    }
}

struct EventTitleBackground_Previews: PreviewProvider {
    static var previews: some View {
        EventTitleBackground()
    }
}
