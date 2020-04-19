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
            }
            Spacer()
            Divider()
            LogListView()
        }
    }
}


struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
