//
//  SelectorError.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI

class SelectorError: ObservableObject {
    @Published var lat_error = false
    @Published var lng_error = false
    @Published var name_error = false
}
