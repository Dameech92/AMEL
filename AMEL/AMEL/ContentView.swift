//
//  ContentView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        // initialize the appearance of the tab bar
        UITabBar.appearance().backgroundColor = UIColor.darkGray
    }
    @State var selected = 0 // the ID of the current tab
    var body: some View {
        TabView(selection: $selected) {
            RecordView().tabItem({
                VStack{
                    Image(systemName: "rectangle.grid.2x2").font(.title)
                    Text("Record Events")
                }
            }).tag(0)
            LogView().tabItem({
                VStack{
                    Image(systemName: "list.dash").font(.title)
                    Text("Log")
                }
            }).tag(1)
            SettingsView().tabItem({
                VStack{
                    Image(systemName: "gear").font(.title)
                    Text("Settings")
                }
            }).tag(2)
        }.accentColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
