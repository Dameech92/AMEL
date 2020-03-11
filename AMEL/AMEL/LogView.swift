//
//  LogView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import UIKit
struct LogView: View {
   // @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        let viewModel = EventViewModel(context :managedObjectContext)
        let FormattedEvents: [EventFormattedForView] = viewModel.GetAllFormattedEvents()
        
        return List {
            Section(header: Text("Events")) {
                
                ForEach((0...(FormattedEvents.count-1)), id: \.self) {
                    EventView(event:FormattedEvents[$0])
                   }
            }
        } .background(Color.white)

    }
}


struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
