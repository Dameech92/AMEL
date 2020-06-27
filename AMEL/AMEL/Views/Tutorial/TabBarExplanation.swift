//
//  TabBarExplanation.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/26/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct TabBarExplanation: View {
    var body: some View {
       HStack {
           Text("This is the navigation bar. Click on the log icon to see the event you recorded.")
           .padding()
       }
       .background(Color("Teal"))
       .cornerRadius(6)
    }
}

struct TabBarExplanation_Previews: PreviewProvider {
    static var previews: some View {
        TabBarExplanation()
    }
}
