//
//  PopupCreator.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/21/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
class PopupCreator: ObservableObject {
    @Published var bools: Array<Bool>
    @Published var showingTutorial: Bool
    @Published var index = 0
    init(length: Int, showingTutorial: Bool){
        self.bools = Array(repeating: false, count: length)
        self.showingTutorial = showingTutorial
        self.bools[0] = true
    }
    func toggleNext() {
        if(self.index < bools.endIndex){
            self.index = self.index + 1
        }
    }
    func togglePrev() {
        if(self.index > bools.startIndex){
            self.index = self.index - 1
        }
    }
    func clear(){
        self.bools = Array(repeating: false, count: self.bools.count)
    }
    func nextTipOnButtonPress() {
        if(self.index == 2) {
            self.index = self.index + 1
        }
    }
    func beginLogPage() {
        self.index = 4
    }
}
