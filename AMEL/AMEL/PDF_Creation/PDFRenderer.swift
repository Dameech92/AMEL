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

class PDFRenderer: NSObject {
    let pathToLogTemplate = Bundle.main.path(forResource: "log", ofType: "html")
    let pathToLogItemTemplate = Bundle.main.path(forResource: "log_item", ofType: "html")
    
    override init() {
        super.init()
    }
    
    func makePDF(events:FetchedResults<Event>) -> NSURL? {
        var logContent = ""
        do {
            logContent = try String(contentsOfFile: pathToLogTemplate!)
        }
        catch {
            return nil
        }
        var logItems = ""
        // make log items for each event
        for event in events {
            let eventFormatter = EventFormatter(event: event)
            let itemHTML = getLogItem(eventFormatter: eventFormatter)
            logItems += itemHTML ?? ""
        }
        logContent = logContent.replacingOccurrences(of: "#LOG_ITEMS#", with: logItems)
        return exportHTMLContentToPDF(HTMLContent: logContent)
        
    }
    func getLogItem(eventFormatter: EventFormatter)-> String?{
        do {
            var htmlContent = try String(contentsOfFile: pathToLogItemTemplate!)
            htmlContent = htmlContent.replacingOccurrences(of: "#BOX_COLOR#", with: eventFormatter.getHexColor())
            htmlContent = htmlContent.replacingOccurrences(of: "#EVENT_NAME#", with: eventFormatter.getName())
            htmlContent = htmlContent.replacingOccurrences(of: "#TIME#", with: eventFormatter.getTime())
            htmlContent = htmlContent.replacingOccurrences(of: "#BOBR#", with: eventFormatter.getBoBR())
            htmlContent = htmlContent.replacingOccurrences(of: "#LAT-LNG#", with: eventFormatter.getLatitude())
            htmlContent = htmlContent.replacingOccurrences(of: "#HEADING_COURSE#", with: eventFormatter.getHeading())
            htmlContent = htmlContent.replacingOccurrences(of: "#ALT#", with: eventFormatter.getAltitude())
            htmlContent = htmlContent.replacingOccurrences(of: "#GROUNDSPEED#", with: eventFormatter.getGroundSpeed())
            return htmlContent
        }catch {
            print("Unable to open html template")
        }
        return nil
        
    }
    
    
    func exportHTMLContentToPDF(HTMLContent: String)->NSURL? {
        let printPageRenderer = PrintPageRenderer()
        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRender: printPageRenderer)
        let pdfFileURL = saveViewPdf(data: pdfData)
        return pdfFileURL
    }
    // Save pdf file in document directory
    func saveViewPdf(data: NSMutableData) -> NSURL? {
        
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
    
    func drawPDFUsingPrintPageRenderer(printPageRender: UIPrintPageRenderer) -> NSMutableData {
        let data = NSMutableData()
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        UIGraphicsBeginPDFPage()
        printPageRender.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())
        UIGraphicsEndPDFContext()
        return data
    }
}

