//
//  PDFRenderer.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class PDFRenderer {
    var htmlPages: [String]?
    var renderer: PrintPageRenderer
    var events: FetchedResults<Event>
    let htmlGenerator: HTMLGenerator
    init(events: FetchedResults<Event>){
        self.events = events
        self.htmlGenerator = HTMLGenerator(events: self.events)
        self.htmlPages = htmlGenerator.getHTMLPages()
        self.renderer = PrintPageRenderer()
    }
    
    func makePDF() -> NSURL? {
        self.renderer = makeRenderer(htmlContent: htmlPages![0], index:0)
        let pdfData = drawPDF()
        return getPDFURL(data: pdfData)
    
    }

    func makeRenderer(htmlContent: String, index: Int)->PrintPageRenderer {
        let printPageRenderer = PrintPageRenderer()
        let printFormatter = UIMarkupTextPrintFormatter(markupText: htmlContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: index)
        return printPageRenderer
    }
    
    func getPDFURL(data: NSMutableData) -> NSURL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        let pdfPath = docDirectoryPath.appendingPathComponent("viewPdf.pdf")
        if data.write(to: pdfPath, atomically: true) {
            let fileURL = NSURL(fileURLWithPath: pdfPath.path)
            return fileURL
        } else {
            return nil
        }
    }
    
    func drawPDF() -> NSMutableData {
        let data = NSMutableData()
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        for i in 0..<self.htmlPages!.endIndex {
            updateRendererData(pageIndex: i)
            UIGraphicsBeginPDFPage()
            self.renderer.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }
        UIGraphicsEndPDFContext()
        return data
    }
    
    func updateRendererData(pageIndex: Int) {
        self.renderer = makeRenderer(htmlContent: self.htmlPages![pageIndex], index: pageIndex)
    }
    
}

