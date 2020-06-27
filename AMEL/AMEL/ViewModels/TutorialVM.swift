//
//  TutorialVM.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/21/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import SwiftUI
struct TutorialVM {
    @State var tabSelected = 0
    @ObservedObject var popups = PopupCreator(length: 6, showingTutorial: true)
    
    func nextPopup() {
        self.popups.toggleNext()
    }
    func prevPopup() {
        self.popups.togglePrev()
    }
    func nextPage() {
        
    }
    func end() {
        self.popups.clear()
        self.popups.showingTutorial = false
        
    }
    
}
