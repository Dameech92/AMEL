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
    @ObservedObject var popups: PopupCreator
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
            }
            Spacer()
            Divider()
            if(self.popups.index == 0){
                EventsExplanation()
            }
           List {
            ForEach(self.events.indices) { index in
                EventView(event: self.events[index], popups: self.popups, logIndex: index)
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
        LogView(popups: PopupCreator(length: 0, showingTutorial: false))
    }
}
