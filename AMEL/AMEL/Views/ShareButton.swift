//
//  ShareButton.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/13/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ShareButton: View {
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @State var showOptions:Bool = false
    var body: some View {
        HStack {
            Button(action: {
                 self.showOptions = true
            }) {
                Image(systemName: "square.and.arrow.up")
                .font(.system(size: 30))
                .frame(alignment: .leading)
            }.disabled(self.events.count == 0)
        }.sheet(isPresented: $showOptions) {
            ExportOptions(events: self.events)
        }
        .padding()
        
    }
}

