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
                    Text("Almost Done!")
                        .font(smallView ? .largeTitle : .system(size: 50.0))
                    .bold()
                    Spacer()
                }
                HStack {
                    Text("Before using the app you must read our ")
                        .foregroundColor(.primary)
                    Spacer()
                }.font(self.widthSizeClass == .compact ? .body : .title)
                HStack(spacing: 0){
                    Text("privacy policy")
                        .underline()
                        .foregroundColor(Color.blue)
                        .onTapGesture {
                            UIApplication.shared.open(URL(string: "https://pdfhost.io/v/lXQ8ZUIkh_AMEL_Privacy_Policypdf.pdf")!)
                    }
                    Text(" and ")
                    .foregroundColor(.primary)
                    Text("user agreement")
                        .underline()
                        .foregroundColor(Color.blue)
                        .onTapGesture {
                    UIApplication.shared.open(URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                        }
                    Spacer()
                }.font(self.widthSizeClass == .compact ? .body : .title)
                Spacer()
                Group {
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
                             Text("I agree to the privacy policy and user agreement")
                        }
                        Spacer()
                    
                    }.font(smallView ? .body : .title)
                    Divider()
                }
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
                
            }.padding()
            
            
        }
    }
}

struct Agreement_Previews: PreviewProvider {
    static var previews: some View {
        Agreement(showingTutorial: .constant(true)).previewDevice("iPhone 11")
        }
}

