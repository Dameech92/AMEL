//
//  ClearAllButton.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/13/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import CoreData
struct ClearAllButton: View {
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
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
    }
}

struct ClearAllButton_Previews: PreviewProvider {
    static var previews: some View {
        ClearAllButton()
    }
}
