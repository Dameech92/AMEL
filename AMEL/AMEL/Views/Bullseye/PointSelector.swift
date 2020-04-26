//
//  PointSelector.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/26/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct PointSelector: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var BEName = ""
    @ObservedObject var pickerData = PickerData()
    var body: some View {
        let refAction = ReferencePointAction(pickerData: self.pickerData, context: self.managedObjectContext)
        return VStack {
            HStack {
                TextField("Enter B/E name", text: $BEName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                Button(action: {
                       refAction.recordReferencePoint(name: self.BEName)
                   }){
                       Text("Save")
                   }
                   .padding()
            }
            
            HStack {
                Text("Latitude")
                Spacer()
                Text("Longitude")
            }
            
            GeometryReader { geometry in
                PickerView(size: geometry.size, pickerData: self.pickerData)
            }.frame(height: 100)
                .clipped()
        }
    }
}

struct PointSelector_Previews: PreviewProvider {
    static var previews: some View {
        PointSelector()
    }
}
