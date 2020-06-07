//
//  SavePoint.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SaveNewPoint: View {
    @ObservedObject var selectorData: SelectorData
    @ObservedObject var errors: SelectorError
    let refAction: ReferencePointAction
    var body: some View {
        HStack {
            Button(action: {
                self.refAction.setErrors()
                if self.refAction.dataIsValid() {
                    self.refAction.saveNewPoint(name: self.selectorData.pointName)
                }
                else {
                    self.refAction.resetFieldOnError()
                }
            }){
                Text("Save New")
            }
        }
    }
}
