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
    @State private var showShareSheet = false
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        let pdfRenderer = PDFRenderer(events: self.events)
        return VStack {
                Spacer()
                HStack {
                    Button(action: {
                        for event in self.events {
                            self.managedObjectContext.delete(event)
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                    print(error)
                            }
                        }
                    }) {
                        Text("Clear All")
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        if self.events.count > 0 {
                             self.showShareSheet = true
                        }
                    }) {
                        Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 30))
                        .frame(alignment: .leading)
                    }
                    .padding()
                    
                }
                
                Spacer()
                List {
                Section(header: Text("Events")) {
                    
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
                }
            } .background(Color.white)
        }.sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: [pdfRenderer.makePDF()!])
    }
        
    }
}


struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
