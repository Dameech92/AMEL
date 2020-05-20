//
//  MyButtonStyle.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 5/1/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
	
	public func makeBody(configuration: CustomButtonStyle.Configuration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? 0.8 : 1.0)
	}
}
