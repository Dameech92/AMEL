//
//  ButtonView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI

struct RecordView: View {
    @FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.verticalSizeClass) var heightSizeClass
    @ObservedObject var popups: PopupCreator
	private let locationVM = LocationViewModel()
	private let headingVM = HeadingViewModel()
    let refPointVM = ActiveRefPointVM()
	var body: some View {
        ActiveRefPointVM.shared.executeFetchRequest(points: points)
        let landscapeLayout = heightSizeClass == .compact
        ReviewPrompter.requestReviewIfAppropriate()
		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			VStack {
                if(self.popups.index == 0){
                    LiveDataField()
                }
                LiveDataView(popups: self.popups)
                Divider()
                if(self.popups.index == 2){
                    ButtonExplanation()
                }
                if landscapeLayout {
                    VStack {
                        HStack {
                            ForEach(0 ..< self.customButton.count/2) {
                                ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!, popups: self.popups)
                            }
                        }.padding(2)
                        HStack {
                            ForEach(self.customButton.count/2 ..< self.customButton.count) {
                                ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!, popups: self.popups)
                            }
                        }.padding(2)
                    }
                } else {
                    HStack {
                        VStack {
                            ForEach(0 ..< self.customButton.count/2) {
                                ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!, popups: self.popups)
                            }
                        }.padding(2)
                        VStack {
                            ForEach(self.customButton.count/2 ..< self.customButton.count) {
                                ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!, popups: self.popups)
                            }
                        }.padding(2)
                    }
                }
                if(self.popups.index == 3){
                    TabBarExplanation()
                }
			}
			.padding(10)
        }
    }
}

