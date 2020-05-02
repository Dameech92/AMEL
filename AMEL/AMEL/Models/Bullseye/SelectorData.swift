//
//  SelectorData.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI

class SelectorData: ObservableObject {
    @Published var pointName = ""
    @Published var latitude = ""
    @Published var longitude = ""
    @Published var errors = SelectorError()
    
    func resetTextFieldsOnError() {
        if self.errors.lat_error {
            self.latitude = ""
        }
        if self.errors.lng_error {
            self.longitude = ""
        }
        if self.errors.name_error {
            self.pointName = ""
        }
    }
    func resetAllTextFields() {
        self.latitude = ""
        self.longitude = ""
        self.pointName = ""
    }
}
