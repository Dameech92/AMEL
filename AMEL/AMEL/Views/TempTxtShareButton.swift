//
//  TempTxtShareButton.swift
//  AMEL
//
//  Created by Tristan Nibbe on 5/19/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct TempTxtShareButton: View {
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var showShareSheet:Bool = false
    var body: some View {
        Button(action: {
            self.showShareSheet = true
        }) {
            Image(systemName: "square.and.arrow.up")
            .font(.system(size: 30))
            .frame(alignment: .leading)
        }.sheet(isPresented: $showShareSheet){
            ShareSheet(activityItems: [TxtFileWriter.writeLogToTxtFile(events: self.events)!])
        }
    }
}

struct TempTxtShareButton_Previews: PreviewProvider {
    static var previews: some View {
        TempTxtShareButton()
    }
}
