//
//  ContentView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    let popups: PopupCreator
    @State var selected = 0
    var body: some View {
        return TabView(selection: $selected) {
            RecordView(popups: self.popups).tabItem({
                VStack{
                    Image(systemName: "rectangle.grid.2x2").font(.title)
                    Text("Record Events")
                }
            }).tag(0)
            LogView(popups: self.popups).tabItem({
                VStack{
                    Image(systemName: "list.dash").font(.title)
                    Text("Log")
                }
            }).tag(1)
            BullsEyeView().tabItem({
                VStack{
                    Image(systemName: "b.circle").font(.title)
                    Text("BullsEye")
                }
            }).tag(2)
            SettingsView().tabItem({
                VStack{
                    Image(systemName: "gear").font(.title)
                    Text("Settings")
                }
            }).tag(3)
        }.accentColor(Color.blue)
    }
}
