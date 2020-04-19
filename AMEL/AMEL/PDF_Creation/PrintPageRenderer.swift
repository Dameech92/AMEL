//
//  PrintPageRenderer.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import UIKit

class PrintPageRenderer: UIPrintPageRenderer {
    let A4PageWidth: CGFloat = 595.2
    let A4PageHeight: CGFloat = 841.8
    override init() {
        super.init()
     
        // Specify the frame of the A4 page.
        let pageFrame = CGRect(x: 0.0, y: 0.0, width: A4PageWidth, height: A4PageHeight)
     
        // Set the page frame.
        self.setValue(NSValue(cgRect: pageFrame), forKey: "paperRect")
     
        // Set the horizontal and vertical insets (that's optional).
        self.setValue(NSValue(cgRect: pageFrame.insetBy(dx: 10.0, dy: 10.0)), forKey: "printableRect")
    }
}
