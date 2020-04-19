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
	@ObservedObject private var locationManager = LocationManager()
	@FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
	@Environment(\.managedObjectContext) var managedObjectContext
	
	var body: some View {
		let viewModel = SettingsViewModel()
		let buttonList: [CustomButton] = viewModel.getCustomButtons(buttons: customButton, managedObjectContext: self.managedObjectContext)
		
		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			VStack {
				HStack {
					Spacer()
					
					VStack {
						Text("Lat/Long/Alt")
							.font(.largeTitle)
							
						Text("\(locationVM.getLatitude())/\(locationVM.getLongitude())/\(locationVM.getAltitude())")
							.font(.title)
							.padding()
					}
					Spacer()
					
					VStack {
						Text("Heading:")
							.font(.title)
						Text("\(headingVM.getMagHeading())")
							.font(.title)
					}
					Spacer()
				}
				HStack {
					VStack {
						ForEach(Array(stride(from:0, to: buttonList.count, by: 2)), id: \.self) { i in
							ButtonView(name: buttonList[i].buttonName!, color: buttonList[i].buttonColor!)
						}
					}
					VStack {
						ForEach(Array(stride(from:1, to: buttonList.count, by: 2)), id: \.self) { i in
							ButtonView(name: buttonList[i].buttonName!, color: buttonList[i].buttonColor!)
						}
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
