//
//  ButtonView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI
import CoreLocation

struct RecordView: View {
    @FetchRequest(fetchRequest: CustomButton.getCustomButton()) var customButton:FetchedResults<CustomButton>
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    @Environment(\.managedObjectContext) var managedObjectContext
    
	private let locationVM = LocationViewModel()
	private let headingVM = HeadingViewModel()
    let refPointVM = ActiveRefPointVM()
	
	var body: some View {
        //This first if actually only acknowledged they have selected a setting
        //The setting they selected could be denying location services
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                case .notDetermined, .restricted, .denied:
                    print("No access")
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                @unknown default:
                break
            }
            } else {
                print("Location services are not enabled")
        }

        ActiveRefPointVM.shared.executeFetchRequest(points: points)

		return ZStack {
			Color("stealth").edgesIgnoringSafeArea(.all)
			VStack {
                LiveDataView()
                Divider()
				HStack {
					VStack {
                        ForEach(0 ..< self.customButton.count/2) {
                            ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!)
						}.padding(10)
					}
                    VStack {
                        ForEach(self.customButton.count/2 ..< self.customButton.count) {
                            ButtonView(name: self.customButton[$0].buttonName!, color: self.customButton[$0].buttonColor!)
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
