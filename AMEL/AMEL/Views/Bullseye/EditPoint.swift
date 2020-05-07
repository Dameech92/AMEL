//
//  EditPoint.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/7/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct EditPoint: View {
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    @ObservedObject var selectorData: SelectorData
    @ObservedObject var errors: SelectorError
    let refAction: ReferencePointAction
    var body: some View {
        Button(action: {
            for point in self.points {
                if point.isActive {
                    let newPoint = self.refAction.setPointData(refPoint: point, name: self.selectorData.pointName)
                    self.refAction.editPoint(newPoint: newPoint, editPoint: point)
                }
            }
        }) {
            Text("Edit")
        }
    }
}
