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
    @Environment(\.verticalSizeClass) var heightSizeClass
    @Environment(\.horizontalSizeClass) var widthSizeClass
    var body: some View {
        let smallView = self.heightSizeClass == .compact || self.widthSizeClass == .compact
        return ZStack {
            Color(.systemBackground)
            VStack {
                HStack {
                    Text("End User License Agreement")
                        .font(smallView ? .largeTitle : .system(size: 50.0))
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
                    }.font(smallView ? .body : .title)
                    Spacer()
                }.padding()
                Spacer()
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
                    
                
                }.font(smallView ? .body : .title)
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
