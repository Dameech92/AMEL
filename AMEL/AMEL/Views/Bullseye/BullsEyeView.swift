//
//  BullsEyeView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct BullsEyeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var pickerData = PickerData()
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    var body: some View {
        let activePointSetter = ActivePointSetter(points: self.points, managedObjectContext: self.managedObjectContext)
        return VStack {
            PointSelector()
            List {
                Section(header: Text("Saved Points")) {
                    ForEach(self.points, id: \.time) { point in
                        RefPointView(point: point, setter: activePointSetter)
                            
                    }.onDelete { indexSet in
                       if indexSet.first != nil {
                           let deletePoint = self.points[indexSet.first!]
                           self.managedObjectContext.delete(deletePoint)
                           do {
                               try self.managedObjectContext.save()
                           }catch {
                                   print(error)
                           }
                       }
                    }
                }
                
            }
            
           
        }.padding()
    }
}

struct BullsEyeView_Previews: PreviewProvider {
    static var previews: some View {
        BullsEyeView()
    }
}
