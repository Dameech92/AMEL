//
//  ColorSelector.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ColorSelector: View {
    let colorNames = Colors().colorNames
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Done")
                }
            }.padding()
            List {
                ForEach(self.colorNames, id: \.self) { color in
                    ColorDetail(color: color)
                }
            }
        }
        
    }
}

struct ColorSelector_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelector()
    }
}
