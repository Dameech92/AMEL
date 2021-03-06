//
//  CustomizableButton.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct CustomizableButton: View {
	private var buttonName:String
    private var buttonColor:UIColor
	
    init(_ name:String, _ color: UIColor) {
        self.buttonName = name
        self.buttonColor = color
    }
	
	var body: some View {
		ZStack {
			// iphone friendly = width: 150, height: 55
			RoundedRectangle(cornerRadius: 5).frame(width: 300, height: 110).foregroundColor(Color("buttonBackGround")).padding(20)
			Text(self.buttonName).bold()
			
			// Colored left side of the button. Make sure that the frame/dimensions of both the button and this LeftCorner match. The trim is fine and doesn't need to be modified.
			LeftCorner().trim(from: 0.41, to: 0.59).fill(Color(self.buttonColor)).frame(width: 300, height: 110)
		}
	}
}

struct LeftCorner: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.addRoundedRect(in: rect, cornerSize: CGSize(width: 5, height: 5))
		return path
	}
}

struct CustomizableButton_Previews: PreviewProvider {
	static var previews: some View {
		CustomizableButton("test", UIColor.blue)
	}
}
