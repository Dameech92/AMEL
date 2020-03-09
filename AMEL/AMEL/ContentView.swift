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
	init() {
		// initialize the appearance of the tab bar
		UITabBar.appearance().backgroundColor = UIColor.white
	}
	
	@State var selected = 0 // the ID of the current tab
	
    var body: some View {
		TabView(selection: $selected) {
			
           ButtonView()
            .tabItem{
                //vstack not working correctly
                VStack{
                    Image(systemName: "house").foregroundColor(.red)
                        .font(.title)
                    Text("HOME")
                }
                
            }.tag(0)
                
            
			EventListView()
                .tabItem{
                    //vstack not working correctly
                    VStack {
                        Image(systemName:"tray.full")
                            .foregroundColor(.blue)
                            .font(.title)
                        Text("Event Log")
                    }
            }.tag(1)
            
            LocationView()
                .tabItem{
                    //vstack not working correctly
                    VStack {
                        Image(systemName:"map")
                            .foregroundColor(.blue)
                            .font(.title)
                        Text("LAT/Long/Alt")
                    }
            }.tag(2)
            
            SettingsView()
                .tabItem{
                    //vstack not working correctly
                    VStack {
                        Image(systemName:"gear")
                            .font(.title)
                        Text("settings")
                    }
            }.tag(3)
        }.accentColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
