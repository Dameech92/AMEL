//
//  ContentView.swift
//  logLocation
//
//  Created by Marcellini, Neil on 2/24/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//  Created by Cognata, Dimitri on 3/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.

import SwiftUI
import CoreLocation

struct ContentView: View {
	@ObservedObject private var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
	
    var body: some View {
		VStack {
			Text("Lat/Long/Alt")
			LocationView()
            HStack {
                VStack {
                    Button(action: {
						ButtonAction.record("PRESS!", self.locationManager, self.managedObjectContext)
					}) {
                        Text("PRESS!")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
                    }
                        Spacer()
                    
                    Button(action: {
						ButtonAction.record("Radar", self.locationManager, self.managedObjectContext)
					}) {
						Text("Radar!")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
                    }
                        Spacer()
                    
                    Button(action: {
						ButtonAction.record("Button!", self.locationManager, self.managedObjectContext)
					}) {
						Text("Button!")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
					}
                    Spacer()
                        
                } // end VStack
                
                VStack {
					Button(action: {
						ButtonAction.record("Missile", self.locationManager, self.managedObjectContext)
					}) {
						Text("Missle!")
						.frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
					}
					
					Spacer()
			
					Button(action: {
						ButtonAction.record("Radar!", self.locationManager, self.managedObjectContext)
					}) {
						Text("Radar!")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
					}
					
					Spacer()
					
					Button(action: {
						ButtonAction.record("Button!", self.locationManager, self.managedObjectContext)
					}) {
						Text("Button!")
						.frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
					}
					Spacer()
				} // end VStack
            } // end HStack
            .padding(10.0)
        } // end VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
