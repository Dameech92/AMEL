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
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        return VStack {
            Spacer()
            HStack {
                ClearAllButton()
                Spacer()
                Text("Event Log")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
                ShareButton()
                Spacer()
                TempTxtShareButton()
                Spacer()
            }
            Spacer()
            Divider()
           List {
           ForEach(self.events, id: \.time) { event in
               EventView(event: event)
              }.onDelete { indexSet in
                   for index in indexSet {
                       let event = self.events[index]
                       self.managedObjectContext.delete(event)
                   }
                  do {
                      try self.managedObjectContext.save()
                  }catch {
                          print(error)
                  }
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
