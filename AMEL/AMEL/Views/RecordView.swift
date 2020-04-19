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
		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			VStack {
				LiveDataView()
                Divider()
				HStack {
					VStack {
                        ForEach(customButton, id: \.index) { button in
							ButtonView(name: button.buttonName!, color: button.buttonColor!)
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
