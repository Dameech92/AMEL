//
//  ColorPickerData.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/19/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI

class ColorPickerData: ObservableObject {
	@Published var currentColor = UIColor.gray
}
