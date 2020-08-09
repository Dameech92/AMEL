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
    private let cards = [TutorialCard(name: "Welcome to AMEL!", text: "Since this is your first time here, how about a quick tutorial?\nClick the arrow or swipe left to get started!\nYou may end the tutorial at any time.", imageName: "launch_logo"), TutorialCard(name: "Record", text: "This is the main page where you can record events and see real time data.", imageName: "record"), TutorialCard(name: "Log", text: "The log page shows all the events you have recorded and their associated data", imageName: "log"), TutorialCard(name: "Bullseye", text: "On the bullseye page you can enter reference points and choose which one is actively tracked.", imageName: "bullseye"), TutorialCard(name: "Settings", text: "In Settings you can add and remove buttons, as well as change their name and color", imageName: "settings")]
    @State private var circles = [true, false, false, false, false]
    var body: some View {
        VStack {
            if(showingTut) {
                cards[selectedImage]
                    .offset(x: offset.width, y: 0)
                    .opacity(3 - Double(abs(offset.width / 100)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset = gesture.translation
                        }
                        .onEnded { _ in
                            if self.offset.width < -100 {
                                self.circles[self.selectedImage] = false
                                self.selectedImage = changeImage(oldIndex: self.selectedImage, newIndex: self.selectedImage + 1, numImages: self.cards.count - 1)
  
                            } else if self.offset.width > 100 {
                                self.circles[self.selectedImage] = false
                                self.selectedImage = changeImage(oldIndex: self.selectedImage, newIndex: self.selectedImage - 1, numImages: self.cards.count - 1)
                            }
                            self.offset = .zero
                            self.circles[self.selectedImage] = true
                        }
                    )
                    
                Divider()
                VStack {
                    HStack {
                        ForEach(self.circles, id: \.self) { circle in
                            Image(systemName: circle ? "circle.fill" : "circle")
                                .imageScale(.small)
                       
                        }
                    }.padding()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.circles[self.selectedImage] = false
                            self.selectedImage = changeImage(oldIndex: self.selectedImage, newIndex: self.selectedImage - 1, numImages: self.cards.count - 1)
                            self.circles[self.selectedImage] = true
                            
                        }, label: {
                            
                            Image(systemName: "arrowtriangle.left.fill")
                                    
                             
                            
                        })
                        Spacer()
                        Button(action: {
                            self.circles[self.selectedImage] = false
                            self.selectedImage = changeImage(oldIndex: self.selectedImage, newIndex: self.selectedImage + 1, numImages: self.cards.count - 1)
                            self.circles[self.selectedImage] = true
                            
                        }, label: {
                            Image(systemName: "arrowtriangle.right.fill")
                        })
                        Spacer()
                    }.font(.largeTitle)
                    .padding()
                    Button(action: {
                        self.showingTut = false
                    }, label: {
                        Text("End Tutorial")
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }).buttonStyle(PlainButtonStyle())
                }
                
                
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
        Group {
            TutorialView(showingTut: true)
                .preferredColorScheme(.light)
            TutorialView(showingTut: true)
                .previewDevice("iPhone 11")
                .preferredColorScheme(.dark)
        }
    }
}
