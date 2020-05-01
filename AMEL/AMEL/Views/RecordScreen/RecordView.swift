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
    private let refPointVM = ActiveRefPointVM()

	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
	
	var body: some View {
		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			VStack {
                LiveDataView(refPointVM: refPointVM)
                Divider()
				HStack {
					VStack {
                        ForEach(0 ..< self.customButton.count/2) {
                            ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!, refPointVM: self.refPointVM)
						}.padding(10)
					}
                    VStack {
                        ForEach(self.customButton.count/2 ..< self.customButton.count) {
                            ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!, refPointVM: self.refPointVM)
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
