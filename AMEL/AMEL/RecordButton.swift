//
//  RecordButton.swift
//  AMEL
//
//  Created by Neil Marcellini on 3/9/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation

struct RecordButton {
    private var name: String
    init(name:String) {
        self.name = name
    }
    func getName()->String {
        return self.name
    }
}
