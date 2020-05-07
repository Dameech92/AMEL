//
//  EditPoint.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/7/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SaveChanges: View {
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    @ObservedObject var selectorData: SelectorData
    @ObservedObject var errors: SelectorError
    let refAction: ReferencePointAction
    var body: some View {
        Button(action: {
            for point in self.points {
                if point.isActive {
                    self.refAction.setErrors()
                    if self.refAction.dataIsValid(){
                        self.refAction.editPoint(point: point)
                    }
                    else {
                        self.refAction.resetFieldOnError()
                    }
                }
            }
        }) {
            Text("Save Changes")
        }.disabled(self.points.isEmpty)
    }
}
