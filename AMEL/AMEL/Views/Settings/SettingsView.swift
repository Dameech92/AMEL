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
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        let viewModel = SettingsViewModel(savedButtons: self.customButton, context: self.managedObjectContext)
        return VStack {
            SettingsHeader(viewModel: viewModel)
                .edgesIgnoringSafeArea(.top)
            List {
                ForEach(self.customButton, id: \.index) { button in
                    ButtonRow(button: button, customButtons: self.customButton, buttonData: ButtonData(button: button))
                }.onDelete { indexSet in
                    if indexSet.first != nil {
                        let deleteButton = self.customButton[indexSet.first!]
                        self.managedObjectContext.delete(deleteButton)
                        
                        print("Deleting button at position \(indexSet.first!)")
                        for i in indexSet.first!...self.customButton.count - 1 {
                            self.customButton[i].index = NSNumber(integerLiteral: i - 1)
                        }
                        
                        viewModel.saveCustomButtons(managedObjectContext: self.managedObjectContext)
                    }
                }
                .onMove(perform: move)
            }
            
        }
        
    }
    func move(from source: IndexSet, to destination: Int) {
        var buttons: [CustomButton]
        do{
            try buttons = CustomButton.getCustomButton().execute()
            buttons.move(fromOffsets: source, toOffset: destination)
            for button in self.customButton{
                button.index = buttons.firstIndex(of: button) as NSNumber?
            }
            do{
                try managedObjectContext.save()
            }catch{
                print(error)
            }
        } catch {
            print(error)
        }
    }
}
