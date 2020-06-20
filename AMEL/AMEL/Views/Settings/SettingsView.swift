//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import CoreData
struct SettingsView: View {
	@State private var colorIndex = 0
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButtons:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        let viewModel = SettingsViewModel(savedButtons: self.customButtons, managedObjectContext: self.managedObjectContext)
        return VStack(spacing: 0) {
            SettingsHeader(viewModel: viewModel)
            
            Divider()
            List {
                ForEach(self.customButtons, id: \.index) { button in
                    ButtonRow(button: button, customButtons: self.customButtons, buttonData: ButtonData(button: button))
                }.onDelete { indexSet in
                    if indexSet.first != nil {
                        let deleteButton = self.customButtons[indexSet.first!]
                        self.managedObjectContext.delete(deleteButton)
                        
                        print("Deleting button at position \(indexSet.first!)")
                        for i in indexSet.first!...self.customButtons.count - 1 {
                            self.customButtons[i].index = NSNumber(integerLiteral: i - 1)
                        }
                        
                        viewModel.saveCustomButtons()
                    }
                }
            }
        }
    }
        
    }
