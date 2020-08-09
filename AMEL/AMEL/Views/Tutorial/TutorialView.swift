//
//  TutorialView.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/20/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct TutorialView: View {
    @State var selectionMade = false
    @State private var offset = CGSize.zero
    @State private var currentIndex = 0
    @State private var selectedImage = 0
    @State var showingTut: Bool
    private let imageNames = ["record", "log", "bullseye", "settings"]
    var body: some View {
//        if #available(iOS 14.0, *) {
//            TabView(selection: $currentIndex) {
//                ForEach(0..<messages.count, id: \.self) { index in
//                    Text(messages[index])
//
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            .background(Color.gray)
//        } else {
//            // Fallback on earlier versions
//        }
//        }
        VStack {
            if(showingTut) {
                Image(self.imageNames[self.selectedImage])
                    .resizable()
                    .offset(x: offset.width, y: 0)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset = gesture.translation
                        }
                        .onEnded { _ in
                            if self.offset.width < -100 {
                                self.selectedImage += 1
                                self.offset = .zero
                            } else if self.offset.width > 100 {
                                self.selectedImage -= 1
                                self.offset = .zero
                            }
                            else {
                                self.offset = .zero
                            }
                        }
                    )
                Image(systemName: "circle")
                Button("End Tutorial"){
                    self.showingTut = false
                }
            } else {
                ContentView()
            }
            
        }
        
    }
                
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(showingTut: true)
    }
}
