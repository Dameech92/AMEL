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
    let pdfRenderer = PDFRenderer()
    var body: some View {
        let viewModel = EventViewModel(context :managedObjectContext)
        let FormattedEvents: [EventFormattedForView] = viewModel.GetAllFormattedEvents(events: events)
        
        return VStack {
                Spacer()
                Button(action: {
                    self.showShareSheet = true
                }) {
                    Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 30))
                }
                .frame(alignment: .leading)
                Spacer()
                List {
                Section(header: Text("Events")) {
                    
                    ForEach((0..<(FormattedEvents.count)), id: \.self) {
                        EventView(event:FormattedEvents[$0])
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
            ShareSheet(activityItems: [self.pdfRenderer.makePDF(events: self.events)!])
    }
        
    }
}


struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
