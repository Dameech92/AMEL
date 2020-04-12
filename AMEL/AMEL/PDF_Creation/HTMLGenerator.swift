//
//  HTMLPageGenerator.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/9/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class HTMLGenerator {
    let pathToLogTemplate: String?
    let pathToLogItemTemplate: String?
    var logTemplate: String?
    var pageContent = ""
    var logItems = ""
    let events: FetchedResults<Event>
    var htmlPages = [String]()
    let eventsPerPage = 7
    init(events: FetchedResults<Event>) {
        self.events = events
        self.pathToLogTemplate = Bundle.main.path(forResource: "log", ofType: "html")
        self.pathToLogItemTemplate = Bundle.main.path(forResource: "log_item", ofType: "html")
    }
    
    func getHTMLPages()->[String]?{
        self.logTemplate = getLogTemplate()
        self.pageContent = self.logTemplate!
        for i in 0..<self.events.endIndex {
            if pageShouldBeMade(index: i) {
                addPage()
            }
            let eventFormatter = EventFormatter(event: self.events[i])
            let itemHTML = getLogItem(eventFormatter: eventFormatter)
            self.logItems += itemHTML ?? ""
        }
        addPage()
        return self.htmlPages
    }
    func pageShouldBeMade(index: Int)->Bool {
        return index % self.eventsPerPage == 0 && index != 0
    }
    
    func addPage(){
        self.pageContent = self.pageContent.replacingOccurrences(of: "#LOG_ITEMS#", with: self.logItems)
        self.htmlPages.append(pageContent)
        self.logItems = ""
        self.pageContent = self.logTemplate!
    }
    
    func getLogTemplate()->String? {
        do {
            logTemplate = try String(contentsOfFile: pathToLogTemplate!)
        }
        catch {
            return nil
        }
        return logTemplate
    }
    func getLogItem(eventFormatter: EventFormatter)-> String?{
        do {
            var htmlContent = try String(contentsOfFile: pathToLogItemTemplate!)
            htmlContent = htmlContent.replacingOccurrences(of: "#BOX_COLOR#", with: eventFormatter.getHexColor())
            htmlContent = htmlContent.replacingOccurrences(of: "#EVENT_NAME#", with: eventFormatter.getName())
            htmlContent = htmlContent.replacingOccurrences(of: "#TIME#", with: eventFormatter.getTime())
            htmlContent = htmlContent.replacingOccurrences(of: "#BOBR#", with: eventFormatter.getBoBR())
            htmlContent = htmlContent.replacingOccurrences(of: "#LAT_LNG#", with: eventFormatter.getLatLng())
            htmlContent = htmlContent.replacingOccurrences(of: "#HEADING_COURSE#", with: eventFormatter.getHeadingCourse())
            htmlContent = htmlContent.replacingOccurrences(of: "#ALT#", with: eventFormatter.getAltitude())
            htmlContent = htmlContent.replacingOccurrences(of: "#GROUNDSPEED#", with: eventFormatter.getGroundSpeed())
            return htmlContent
        }catch {
            print("Unable to open html template")
        }
        return nil
        
    }
}
