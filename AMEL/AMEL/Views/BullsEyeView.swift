//
//  BullsEyeView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct BullsEyeView: View {
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var BEName = ""
    @ObservedObject var pickerData = PickerData()
    var body: some View {
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext)
        return VStack {
            TextField("Enter B/E name", text: $BEName)
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
            .foregroundColor(Color.green)
           
            Spacer()
            
            List {
                ForEach(self.points, id: \.time) { point in
                    ReferencePointView(point: point)
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
