//
//  SettingsClear.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsClear: View {
    @FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButtons:FetchedResults<CustomButton>
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        Button(action: {
            for button in self.customButtons {
                self.managedObjectContext.delete(button)
                do {
                    try self.managedObjectContext.save()
                }catch {
                        print("Error deleting all buttons")
                }
            }
            
        }) {
            Text("Clear All")
        }
    }
}
