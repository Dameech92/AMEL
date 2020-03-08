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
		UITabBar.appearance().backgroundColor = UIColor.darkGray
	}
	
	@State var selected = 0 // the ID of the current tab
	
    var body: some View {
		TabView(selection: $selected) {
			ButtonView().tabItem({
				Image("folder").font(.title)
				Text("rrr")
			}).tag(0)
			LogView().tabItem({
				Image("folder").font(.title)
				Text("asd")
			}).tag(1)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
