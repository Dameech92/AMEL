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
    let tutorialVM = TutorialVM()
    var body: some View {
        return VStack {
            if(!selectionMade){
                Text("Welcome to AMEL!")
                Button(action:{
                    self.selectionMade = true
                }) {
                    Text("Show Me Around")
                }
                Button(action:{
                    self.tutorialVM.end()
                    self.selectionMade = true
                }){
                    Text("No Thanks")
                }
            }
            else if(self.tutorialVM.popups.showingTutorial) {
                VStack {
                    HStack {
                        Button(action: {
                            self.tutorialVM.prevPopup()
                        }){
                            Image(systemName: "arrow.left")
                        }
                        Button(action: {
                            self.tutorialVM.nextPopup()
                            
                        }){
                            Image(systemName: "arrow.right")
                        }
                        Button(action: {
                            self.tutorialVM.nextPage()
                            
                        }){
                            Text("Next Page")
                        }
                        Button(action: {
                            self.tutorialVM.end()
                        }){
                            Text("End Tutorial")
                        }
                    }
                    ContentView(popups: self.tutorialVM.popups)
                }
                
            }
        }
        
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
