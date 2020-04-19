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
    @State var showShareSheet:Bool = false
    var body: some View {
        let pdfRenderer = PDFRenderer(events: self.events)
        return HStack {
            Button(action: {
                if self.events.count > 0 {
                     self.showShareSheet = true
                }
            }) {
                Image(systemName: "square.and.arrow.up")
                .font(.system(size: 30))
                .frame(alignment: .leading)
            }
        }.sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: [pdfRenderer.makePDF()!])
        }
        .padding()
        
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(showShareSheet: false)
    }
}
