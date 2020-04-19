//
//  ColorView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/18/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI

struct HighlightedButton: ButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label.padding().foregroundColor(.white).background(configuration.isPressed ? Color.red: Color.black).cornerRadius(8.0)
	}
}

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
		return VStack {
			HStack {
				Text("Current color: ").foregroundColor(.primary).font(.headline)
				Color(buttonList[self.buttonIndex].buttonColor!).frame(width: 50, height: 50)
			}.frame(alignment: .leading)
			HStack {
				Text("Choose button color:").padding(.leading).font(.headline)
				ForEach((0 ..< self.colors.count), id: \.self) { i in
					Button(action: {
						buttonList[self.buttonIndex].buttonColor = self.colors[i]
						viewModel.saveCustomButtons(managedObjectContext: self.managedObjectContext)
					}) {
						Text("\(self.colorNames[i])")
					}.buttonStyle(HighlightedButton())
				}
			}.frame(alignment: .leading)
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
