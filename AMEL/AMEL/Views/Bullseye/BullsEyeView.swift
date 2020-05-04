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
    @ObservedObject var pickerData = PickerData()
    var body: some View {
        let selectorData = SelectorData(points: self.points)
        let activePointSetter = ActivePointSetter(points: self.points, managedObjectContext: self.managedObjectContext, selectorData: selectorData)
        
        return VStack {
            PointSelector(points: self.points, pickerData: self.pickerData, pointSetter: activePointSetter)
            List {
                Section(header: Text("Saved Points")) {
                    ForEach(self.points, id: \.time) { point in
                        RefPointView(point: point, activePoint: activePointSetter)
                            
                    }.onDelete { indexSet in
                       if indexSet.first != nil {
                           let deletePoint = self.points[indexSet.first!]
                            if deletePoint.isActive {
                                activePointSetter.selectorData.resetAllTextFields()
                                self.pickerData.resetPickers()
                            }
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
