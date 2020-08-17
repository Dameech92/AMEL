//
//  TutorialCard.swift
//  AMEL
//
//  Created by Neil Marcellini on 8/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct TutorialCard: View {
    let name: String
    let text: String
    let imageName: String
    @Environment(\.verticalSizeClass) var heightSizeClass
    @Environment(\.horizontalSizeClass) var widthSizeClass
    var body: some View {
        let smallText = self.widthSizeClass == .compact || self.heightSizeClass == .compact
        let landscape = self.heightSizeClass == .compact
        return ZStack {
            Color(.systemBackground) //makes whole view draggable
            GeometryReader { g in
                
                if landscape {
                    VStack {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(self.name)
                                    .font(.headline)
                                    .bold()
                                    .padding()
                            }
                            VStack(alignment: .leading) {
                                Text(self.text)
                                .lineLimit(nil)
                                .padding()
                            }
                            
                        }
                        
                        if smallText {
                            Image(self.imageName + ".landscape.small")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        } else {
                            Image(self.imageName + ".landscape")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        }
                        
                    }
                    
                    
                } else {
                    VStack {
                       
                            HStack {
                                Text(self.name)
                                    .font(smallText ? .largeTitle : .system(size: 50.0))
                                    .bold()
                                    .padding()
                                Spacer()
                            }
                            HStack {
                                Text(self.text)
                                    .font(smallText ? .body : .title)
                                    .lineLimit(nil)
                                    .padding()
                                Spacer()
                            }
                               
                            if g.size.width > g.size.height {
                                Image(self.imageName + ".landscape")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .padding()
                            } else if smallText {
                               Image(self.imageName + ".small")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .padding()
                           } else {
                               Image(self.imageName)
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .padding()
                           }
                               
                           
                    }
                    .padding()
                }
            }
            
        }
    }
}

struct TutorialCard_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCard(name: "Welcome to AMEL!", text: "Since this is your first time here, how about a quick tutorial?\nClick the arrow or swipe left to get started!\nYou may end the tutorial at any time.", imageName: "launch_logo")
    }
}
