//
//  SelectorData.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
class SelectorData: ObservableObject {
    @Published var pointName = ""
    @Published var latitude = ""
    @Published var longitude = ""
    @Published var errors = SelectorError()
    init(points: FetchedResults<ReferencePoint>) {
        let pointGetter = ActivePointCreator(points: points)
        let activePoint = pointGetter.getActivePoint()
        let updater = SelectorUpdater(selectorData: self)
        updater.updatePointSelector(point: activePoint)
    }
    
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
