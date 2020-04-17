//
//  BullsEyeView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct BullsEyeView: View {
    @FetchRequest(fetchRequest: Point.getPoints()) var points:FetchedResults<Point>
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var BEName = ""
    
    var body: some View {
        VStack {
            TextField("Enter B/E name", text: $BEName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            
            GeometryReader { geometry in
               PickerView(size: geometry.size)
            }.frame(height: 100)
                .clipped()
           
            Button(action: {}){
                Text("Add B/E point")
            }
            .padding()
            .foregroundColor(Color.green)
           
            Spacer()
            
            List {
                ForEach(self.points) { point in
                    HStack {
                        Text(point.ns!)
                        Text("\(point.lat!)")
                        Text(point.ew!)
                        Text("\(point.lng!)")
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
