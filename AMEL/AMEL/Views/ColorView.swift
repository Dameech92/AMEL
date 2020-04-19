//
//  ColorView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/18/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI


struct ColorView: View {
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
	private let colorNames = ["Red", "Green", "Blue", "Purple", "Orange", "Gray"]
	private let colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.purple, UIColor.orange, UIColor.gray]
	private var buttonIndex = 0
	
	init(_ buttonIndex:Int) {
		self.buttonIndex = buttonIndex
	}
	
	var body: some View {
		let viewModel = SettingsViewModel()
		let buttonList: [CustomButton] = viewModel.getCustomButtons(buttons: customButton, managedObjectContext: self.managedObjectContext)
		
		return HStack {
			Text("Choose button color:").padding(.leading)
			ForEach((0 ..< buttonList.count), id: \.self) { i in
				Button(action: {
					buttonList[self.buttonIndex].buttonColor = self.colors[i]
					viewModel.saveCustomButtons(managedObjectContext: self.managedObjectContext)
				}) {
					Text("\(self.colorNames[i])").foregroundColor(.primary).padding(.leading).font(.title)
				}
			}
//			Button(action: {
//				buttonList[self.buttonIndex].buttonColor = UIColor.red
//			}) {
//				Text("Red")
//			}
//			Button(action: {
//				buttonList[self.buttonIndex].buttonColor = UIColor.green
//			}) {
//				Text("Green")
//			}
//			Button(action: {
//				buttonList[self.buttonIndex].buttonColor = UIColor.blue
//			}) {
//				Text("Blue")
//			}
		}
	}
}

#if DEBUG
struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(0)
    }
}
#endif
