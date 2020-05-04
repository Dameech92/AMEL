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
    @ObservedObject var errors: SelectorError
    let refAction: ReferencePointAction
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.errors.lat_error = !self.refAction.latInRange(lat: self.selectorData.latitude)
                self.errors.lng_error = !self.refAction.lngInRange(lng: self.selectorData.longitude)
                self.errors.name_error = !self.refAction.nameIsValid(name: self.selectorData.pointName)
                if self.refAction.dataIsValid(lat: self.selectorData.latitude, lng: self.selectorData.longitude, name: self.selectorData.pointName) {
                    self.refAction.recordReferencePoint(name: self.selectorData.pointName)
                }
                else {
                    if self.errors.lat_error {
                        self.selectorData.latitude = ""
                    }
                    if self.errors.lng_error {
                        self.selectorData.longitude = ""
                    }
                    if self.errors.name_error {
                        self.selectorData.pointName = ""
                    }
                }
                
                
            }){
                Text("Save")
            }
        }.padding(.trailing)
    }
}
