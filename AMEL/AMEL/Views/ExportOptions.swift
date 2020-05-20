//
//  ExportOptions.swift
//  AMEL
//
//  Created by Neil Marcellini on 5/19/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ExportOptions: View {
    @State private var textShare = false
    @State private var pdfShare = false
    @Environment(\.presentationMode) var presentationMode
    let buttonScale = CGFloat(0.7)
    var events:FetchedResults<Event>
    var body: some View {
        let pdfRenderer = PDFRenderer(events: self.events)
        return VStack{
            HStack {
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Done")
                }
            }.padding()
            Spacer()
            GeometryReader { g in
                VStack {
                    Button(action: {
                         self.pdfShare = true
                    }) {
                        VStack{
                            Text("Export PDF")
                                .font(.largeTitle)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 20)
                            Image(systemName: "doc")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: g.size.height / 2 * self.buttonScale)
                                .padding(.horizontal, 30)
                                .padding(.bottom, 20)
                                
                        }.background(Color("buttonBackGround"))
                        .cornerRadius(10)
                            
                        
                    }.sheet(isPresented: self.$pdfShare){
                        ShareSheet(activityItems: [pdfRenderer.makePDF()!])
                    }
                    Spacer()
                    Button(action: {
                         self.textShare = true
                    }) {
                        VStack {
                            Text("Export Text")
                                .font(.largeTitle)
                                .padding(.horizontal, 30)
                            Image(systemName: "doc.text")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: g.size.height / 2 * self.buttonScale)
                                .padding(.horizontal, 30)
                        }
                        .background(Color("buttonBackGround"))
                        .cornerRadius(10)
                        
                    }.sheet(isPresented: self.$textShare){
                        ShareSheet(activityItems: [TxtFileWriter.writeLogToTxtFile(events: self.events)!])
                    }
                    Spacer()
                }
            }
        }
    }
}
