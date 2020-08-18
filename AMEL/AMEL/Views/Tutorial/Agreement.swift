//
//  Agreement.swift
//  AMEL
//
//  Created by Neil Marcellini on 8/17/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct Agreement: View {
    @Binding var showingTutorial: Bool
    @State private var agreed = false
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                HStack {
                    Text("End User License Agreement")
                    .font(.largeTitle)
                    //.font(.system(size: 50.0))
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
                HStack() {
                    VStack {
                        Button(action: {
                            self.agreed = !self.agreed
                        }) {
                            Image(systemName: self.agreed ? "checkmark.square" : "square")
                                .font(.title)
                        }
                    }
                    VStack {
                         Text("I agree to the end user license agreement")
                    }
                    
                
                }
                Divider()
                Spacer()
                Button(action: {
                    self.showingTutorial = false
                }, label: {
                    Text("End Tutorial")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    }).buttonStyle(PlainButtonStyle())
                    .disabled(!self.agreed)
            
                Spacer()
                
            }
            
            
        }
    }
}
