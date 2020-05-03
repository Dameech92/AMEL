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
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    @ObservedObject var selectorData = SelectorData()
    @ObservedObject var pickerData = PickerData()
    var body: some View {
        let activePointSetter = ActivePointSetter(points: self.points, managedObjectContext: self.managedObjectContext, selectorData: self.selectorData)
        
        return VStack {
            PointSelector(selectorData: self.selectorData, pickerData: self.pickerData, pointSetter: activePointSetter)
            List {
                Section(header: Text("Saved Points")) {
                    ForEach(self.points, id: \.time) { point in
                        RefPointView(point: point, activePoint: activePointSetter)
                            
                    }.onDelete { indexSet in
                       if indexSet.first != nil {
                           let deletePoint = self.points[indexSet.first!]
                           self.managedObjectContext.delete(deletePoint)
                           do {
                               try self.managedObjectContext.save()
                           }catch {
                                   print(error)
                           }
                            self.selectorData.resetAllTextFields()
                            self.pickerData.resetPickers()
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
