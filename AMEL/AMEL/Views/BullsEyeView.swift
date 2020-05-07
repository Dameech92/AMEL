//
//  BullsEyeView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/15/20.
//Created by Dimitri Cognata on5/1/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI


struct BullsEyeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var BEName = ""
    
    @ObservedObject var pickerData = PickerData()
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    var body: some View {
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext)
        return VStack {
            TextField("Enter B/E name!", text: $BEName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            
            GeometryReader { geometry in
                PickerView(size: geometry.size, pickerData: self.pickerData)
            }.frame(height: 100)
                .clipped()
           
            Button(action: {
                refAction.recordReferencePoint(name: self.BEName)
            }){
                Text("Add B/E point")
            }
            .padding()
            .foregroundColor(Color("Green"))
            ClearBullsEye()
            List {
                ForEach(self.points, id: \.time) { point in
                    RefPointView(point: point)
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
            
           
        }.padding()
    }
}

struct BullsEyeView_Previews: PreviewProvider {
    static var previews: some View {
        BullsEyeView()
    }
}
