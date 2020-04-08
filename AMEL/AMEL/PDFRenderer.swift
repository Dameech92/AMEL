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
    let pathToLogTemplate = Bundle.main.path(forResource: "log", ofType:"html")
    let pathToLogItemTemplate = Bundle.main.path(forResource: "log_item", ofType:"html")
    
    override init() {
        super.init()
    }
    
    func makePDF(events:FetchedResults<Event>) ->String {
        for event in events {
            getLogItem(event: event)
        }
    }
    func getLogItem(event:Event)-> String?{
        do {
            var htmlContent = try String(contentsOfFile: pathToLogItemTemplate!)
            htmlContent = htmlContent.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
        }catch {
            print("Unable to open html template")
        }
        return nil
        
    }
    
    func renderInvoice(invoiceNumber: String, invoiceDate: String, recipientInfo: String, items: [[String: String]], totalAmount: String) -> String! {
        
        
        do {
            var HTMLContent = try String(contentsOfFile: pathToLogTemplate!)
            // Replace all the placeholders with real values except for the items.
                   // The logo image.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#LOGO_IMAGE#", with: logoImageURL)
            
                   // Invoice number.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#INVOICE_NUMBER#", with: invoiceNumber)
            
                   // Invoice date.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#INVOICE_DATE#", with: invoiceDate)
            
                   // Due date (we leave it blank by default).
            HTMLContent = HTMLContent.replacingOccurrences(of: "#DUE_DATE#", with: dueDate)
            
                   // Sender info.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#SENDER_INFO#", with: senderInfo)
            
                   // Recipient info.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#RECIPIENT_INFO#", with: recipientInfo.replacingOccurrences(of:"\n", with: "<br>"))
            
                   // Payment method.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#PAYMENT_METHOD#", with: paymentMethod)
            
                   // Total amount.
            HTMLContent = HTMLContent.replacingOccurrences(of: "#TOTAL_AMOUNT#", with: totalAmount)
            
            do {
                var allItems = ""
                for i in 0..<items.count {
                    var itemHTMLContent:String!
                    // Determine the proper template file.
                    if i != items.count - 1 {
                        itemHTMLContent = try String(contentsOfFile: pathToLogItemTemplate!)
                    }
                    else {
                        itemHTMLContent = try String(contentsOfFile: pathToLastItemHTMLTemplate!)
                    }
                    // Replace the description and price placeholders with the actual values.
                    itemHTMLContent = itemHTMLContent.replacingOccurrences(of:"#ITEM_DESC#", with: items[i]["item"]!)
        
                   // Format each item's price as a currency value.
                   let formattedPrice = AppDelegate.getAppDelegate().getStringValueFormattedAsCurrency(items[i]["price"]!)
                    itemHTMLContent = itemHTMLContent.replacingOccurrences(of:"#PRICE#", with: formattedPrice)
                   // Add the item's HTML code to the general items string.
                   allItems += itemHTMLContent
                }
                // Set the items.
                HTMLContent = HTMLContent.replacingOccurrences(of:"#ITEMS#", with: allItems)
                // The HTML code is ready.
                return HTMLContent
            }
            
        }
        catch {
            print("Unable to open html template")
        }
        return nil
    }
    
    func exportHTMLContentToPDF(HTMLContent: String) {
        let printPageRenderer = CustomPrintPageRenderer()
        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRender: printPageRenderer)
        let pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice\(invoiceNumber ?? "0").pdf"
        pdfData!.write(toFile: pdfFilename, atomically: true)
        print(pdfFilename)
    }
    func drawPDFUsingPrintPageRenderer(printPageRender: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        UIGraphicsBeginPDFPage()
        printPageRender.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())
        UIGraphicsEndPDFContext()
        return data
    }
}

