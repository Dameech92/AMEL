//
//  Agreement.swift
//  AMEL
//
//  Created by Neil Marcellini on 8/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct Agreement: View {
    @State private var agreed = false
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                HStack {
                    Text("End User License Agreement")
                    .font(.system(size: 50.0))
                    .bold()
                    .padding()
                    Spacer()
                }
                HStack {
                    Button(action: {
                        UIApplication.shared.open(URL(string: "https://pdfhost.io/v/u2JYy3yn0_AMEL_End_User_License_Agreement_EULApdf.pdf")!)
                    }) {
                        Text("We're almost done! Before using the app please familiarize yourself with our ")
                            .foregroundColor(.primary)
                        +
                        Text("end user license agreement.")
                        .underline()
                    }
                    Spacer()
                }.padding()
                Divider()
                HStack(alignment: .lastTextBaseline) {
                    Text("I have read and agree to the end user license agreement")
                    Button(action: {
                        self.agreed = !self.agreed
                    }) {
                        Image(systemName: self.agreed ? "checkmark.square" : "square")
                            .font(.title)
                        
                    }
                
                }
                Divider()
                Spacer()
                
            }
            
            
        }
    }
}

struct Agreement_Previews: PreviewProvider {
    static var previews: some View {
        Agreement().previewDevice("iPhone 11")
    }
}
