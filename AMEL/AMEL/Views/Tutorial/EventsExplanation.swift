//
//  EventsExplanation.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/26/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct EventsExplanation: View {
    var body: some View {
        HStack {
            Text("Here you will find all the events you have recorded and their data.")
            .padding()
        }
        .background(Color("Teal"))
        .cornerRadius(6)
    }
}

struct EventsExplanation_Previews: PreviewProvider {
    static var previews: some View {
        EventsExplanation()
    }
}
