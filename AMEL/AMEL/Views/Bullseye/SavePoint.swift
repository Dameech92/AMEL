//
//  SavePoint.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SavePoint: View {
    @ObservedObject var selectorData: SelectorData
    let refAction: ReferencePointAction
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.selectorData.errors.lat_error = !self.refAction.latInRange(lat: self.selectorData.latitude)
                self.selectorData.errors.lng_error = !self.refAction.lngInRange(lng: self.selectorData.longitude)
                self.selectorData.errors.name_error = !self.refAction.nameIsValid(name: self.selectorData.pointName)
                if self.refAction.dataIsValid(lat: self.selectorData.latitude, lng: self.selectorData.longitude, name: self.selectorData.pointName) {
                    self.refAction.recordReferencePoint(name: self.selectorData.pointName)
                    self.selectorData.resetAllTextFields()
                    self.refAction.resetPickers()
                }
                else {
                    self.selectorData.resetTextFieldsOnError()
                }
                
                
            }){
                Text("Save")
            }
        }.padding(.trailing)
    }
}
