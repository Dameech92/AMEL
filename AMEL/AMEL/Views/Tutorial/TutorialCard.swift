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
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .font(.system(size: 50.0))
                    .bold()
                    .padding()
                Spacer()
            }
            
            Text(self.text)
                .font(.title)
                .lineLimit(nil)
                .padding()
            Image(self.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
        .padding()
        
    }
}

struct TutorialCard_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCard(name: "Record", text: "This is the main page where you can record events and see real time data.", imageName: "record")
        TutorialCard(name: "Welcome to AMEL!", text: "Since this is your first time here, how about a quick tutorial?\nClick the arrow or swipe left to get started!\nYou may end the tutorial at any time.", imageName: "launch_logo")
            .previewDevice("iPhone 11")
    }
}