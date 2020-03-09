//
//  LogView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct LogView: View {
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    var body: some View {
        List {
            Section(header: Text("Events")) {
                ForEach(self.events) { (event:Event) in
                    EventView(name: event.name, time: event.time, latitude: event.latitude as! Double, longitude: event.longitude as! Double, altitude: event.altitude as! Double)
               }
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
