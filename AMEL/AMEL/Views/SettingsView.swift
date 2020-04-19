//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	private let colorNames = ["Red", "Green", "Blue", "Purple", "Orange", "Gray"]
	private let colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.purple, UIColor.orange, UIColor.gray]
	@State private var colorIndex = 0
	@ObservedObject var colorPickerData = ColorPickerData()
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
    
	
    var body: some View {
		let viewModel = SettingsViewModel()
		let buttonList: [CustomButton] = viewModel.getCustomButtons(buttons: customButton, managedObjectContext: self.managedObjectContext)
		
		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			
			VStack {
				HStack(alignment: .center) {
					// add a new button to the record events page
					Button(action: {
						let newButton = SettingsViewModel.createCustomButton(managedObjectContext: self.managedObjectContext)
						SettingsViewModel.saveCustomButton(newButton, "New Button", buttonList.count, UIColor.gray, self.managedObjectContext)
					}) {
						VStack {
							Text("Add new button")
							Image(systemName: "plus.square.fill")
						}
					}.foregroundColor(.primary)

					Divider()

					// remove a button from the record events page
					Button(action: {
						if buttonList.count > 1 {
							viewModel.deleteCustomButton(eventToDelete: buttonList[buttonList.count - 1], managedObjectContext: self.managedObjectContext)
						} else {
							print("cannot have less than 1 button")
						}
					}) {
						VStack {
							Text("Remove button")
							Image(systemName: "minus.square.fill")
						}
					}.foregroundColor(.primary)
				
				}.frame(height:60)

				
//				GeometryReader { geometry in
//					PickerView(size: geometry.size, pickerData: self.colorPickerData)
//				}.frame(height: 100)
//					.clipped()
				
				
				NavigationView {
					Form {
						ForEach((0 ..< buttonList.count), id: \.self) { i in
							Picker(selection: self.$colorIndex, label: Text("\(buttonList[i].buttonName!)")) {
								LabelTextField(i)
								ColorView(i)
//								Button(action: {
//									if buttonList.count > 1 {
//										print("Deleting button")
//										viewModel.deleteCustomButton(eventToDelete: buttonList[i], managedObjectContext: self.managedObjectContext)
//									} else {
//										print("cannot have less than 1 button")
//									}
//								}) {
//									VStack {
//										Text("Remove this button")
//										Image(systemName: "minus.square.fill")
//									}
//								}.foregroundColor(.primary)
//								ForEach(0 ..< self.colors.count) {
//									Text(self.colorNames[$0]).tag($0)
//								}
							}
						}.onDelete { indexSet in
						   if indexSet.first != nil {
							   let deleteButton = self.customButton[indexSet.first!]
							   self.managedObjectContext.delete(deleteButton)
							   do {
								   try self.managedObjectContext.save()
							   } catch {
								   print(error)
							   }
						   }
						}
					}.navigationBarTitle(Text("Button List"))
				} // end NavigationView
			}
		}
	}
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif
