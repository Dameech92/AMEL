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
    private let cards = [TutorialCard(text: "This is the main page where you can record events and see real time data.", imageName: "record"), TutorialCard(text: "The log page shows all the events you have recorded and their associated data", imageName: "log"), TutorialCard(text: "On the bullseye page you can enter reference points and choose which one is actively tracked.", imageName: "bullseye"), TutorialCard(text: "In Settings you can add and remove buttons, as well as change their name and color", imageName: "settings")]
    @State private var circles = [true, false, false, false]
    var body: some View {
        VStack {
            if(showingTut) {
                cards[selectedImage]
                    .offset(x: offset.width, y: 0)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset = gesture.translation
                        }
                        .onEnded { _ in
                            if self.offset.width < -100 {
                                self.circles[selectedImage] = false
                                self.selectedImage = changeImage(oldIndex: self.selectedImage, newIndex: self.selectedImage + 1, numImages: self.cards.count - 1)
  
                            } else if self.offset.width > 100 {
                                self.circles[selectedImage] = false
                                self.selectedImage = changeImage(oldIndex: self.selectedImage, newIndex: self.selectedImage - 1, numImages: self.cards.count - 1)
                            }
                            self.offset = .zero
                            self.circles[selectedImage] = true
                        }
                    )
                
                VStack {
                    HStack {
                        ForEach(self.circles, id: \.self) { circle in
                            Image(systemName: circle ? "circle.fill" : "circle")
                       
                        }
                    }.padding()
                    
                    Button("End Tutorial"){
                        self.showingTut = false
                    }.padding()
                    .background(Color.black)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color(red: 66 / 255, green: 155 / 255, blue: 245 / 255).edgesIgnoringSafeArea(.all))
                
                
                
            } else {
                ContentView()
            }
            
        }
        
    }
                
}

func changeImage(oldIndex: Int, newIndex: Int, numImages: Int) -> Int{
    if (newIndex > numImages || newIndex < 0 ) {
        return oldIndex
    } else {
        return newIndex
    }
}


struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(showingTut: true)
    }
}
