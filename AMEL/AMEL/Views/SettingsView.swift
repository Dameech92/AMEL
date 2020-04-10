//
//  SettingsView.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
		VStack {
			ZStack {
//				Image("stealth").resizable().frame(height: 150)
//				Image("buttonBackGround").edgesIgnoringSafeArea(.all)
				HStack {
//					Image("buttonBackGround").resizable().frame(height: 150)
					
					Spacer()
				}
				
				HStack {
					VStack(alignment: .leading, spacing: 45, content: {
						Button(action: {
							
						}) {
							Image("chevron.left").font(.title)
						}
						
						Text("Settings").font(.title)
					}).foregroundColor(Color.black.opacity(0.5))
					
					Spacer()
				}.padding()
					.padding(.top, 10)
				
				VStack {
					Image("name").overlay(Text("K").foregroundColor(.white).font(.title))
					
					Spacer()
				}.padding(.top, 30)
				
			}.frame(height: 175)
			
			Spacer()
		}.background(Color.white)
	}
}

struct buttonView: View {
	var image = ""
	var name = ""
	var body: some View {
		Button(action: {
			
		}) {
			HStack {
				Image(image).renderingMode(.original).resizable().frame(width: 40, height: 40)
				Text(name)
				
				Spacer(minLength: 15)
				
				Image(systemName: "chevron.right")
			}.padding().foregroundColor(Color.black.opacity(0.5))
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
