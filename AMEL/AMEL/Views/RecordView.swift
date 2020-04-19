//
//  ButtonView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI

struct RecordView: View {
	private let locationVM = LocationViewModel()
	private let headingVM = HeadingViewModel()
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
	
	var body: some View {
		let viewModel = SettingsViewModel()
		let buttonList: [CustomButton] = viewModel.getCustomButtons(buttons: customButton, managedObjectContext: self.managedObjectContext)
		
		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			VStack {
				LiveDataView()
                Divider()
				HStack {
					VStack {
						ForEach(Array(stride(from:0, to: buttonList.count, by: 2)), id: \.self) { i in
							ButtonView(name: buttonList[i].buttonName!, color: buttonList[i].buttonColor!)
						}.padding(10)
					}
					VStack {
						ForEach(Array(stride(from:1, to: buttonList.count, by: 2)), id: \.self) { i in
							ButtonView(name: buttonList[i].buttonName!, color: buttonList[i].buttonColor!)
						}.padding(10)
					}
                }
			}
			.padding(10.0)
		}
	}
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
