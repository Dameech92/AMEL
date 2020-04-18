//
//  LogListView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/13/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct LogListView: View {
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        List {
            ForEach(self.events, id: \.time) { event in
                EventView(event: event)
               }.onDelete { indexSet in
               if indexSet.first != nil {
                   let deleteEvent = self.events[indexSet.first!]
                   self.managedObjectContext.delete(deleteEvent)
                   do {
                       try self.managedObjectContext.save()
                   }catch {
                           print(error)
                   }
               }
            }
        } .background(Color.white)
    }
}

struct LogListView_Previews: PreviewProvider {
    static var previews: some View {
        LogListView()
    }
}
