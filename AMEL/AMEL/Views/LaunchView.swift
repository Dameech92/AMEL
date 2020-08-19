//
//  LaunchView.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/21/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    let showTutorial: Bool = true//UserDefaults.standard.integer(forKey: "launchCount") == 1
    var body: some View {
        VStack {
            if(self.showTutorial){
                TutorialView()
            } else {
                ContentView()
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
