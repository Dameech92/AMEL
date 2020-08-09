//
//  TutorialCard.swift
//  AMEL
//
//  Created by Neil Marcellini on 8/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct TutorialCard: View {
    let text: String
    let imageName: String
    var body: some View {
        VStack {
            Text(self.text)
                .font(.title)
                .padding()
            Image(self.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 4)
        )
        
    }
}

struct TutorialCard_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCard(text: "This is the main page where you can record events and see real time data.", imageName: "record")
    }
}
