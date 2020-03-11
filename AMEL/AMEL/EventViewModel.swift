//
//  EventViewModel.swift
//  AMEL
//
//  Created by Nibbe, Tristan on 3/6/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI
import UIKit




class EventViewModel{
    //@FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    var managedObjectContext: NSManagedObjectContext?
    
    init(context: NSManagedObjectContext){
        managedObjectContext = context
    }

    func GetAllFormattedEvents()->Array<EventFormattedForView>{
        var events:Array<Event> = []
        
        do{
            try  events = managedObjectContext!.fetch(Event.getEvents())
        }catch{
            print("error")
        }
        var FormattedEvents: [EventFormattedForView] = []
        events.forEach { (rawEvent) in
            FormattedEvents.append(convertEventToFormatted(event: rawEvent))
        }
    
        return FormattedEvents
    }
    
    func convertEventToFormatted(event:Event) -> EventFormattedForView{
            let longitude = event.longitude
            let latitude = event.latitude
            let altitude = event.altitude
            let magHeading = event.magneticHeading
            let Time = event.time
            let name = event.name
            return EventFormattedForView(name: name!, time: Time!, latitude: latitude, longitude: longitude, altitude: altitude,heading: magHeading);

        }
    
    static func returnBlankEventForTesting() -> EventFormattedForView{
        return EventFormattedForView(name: "Missile", time: Date(), latitude: nil, longitude: nil, altitude: nil,heading: nil);
    }
}

class EventFormattedForView{
    var name: String
    var time: Date
    var latitude: NSNumber?
    var longitude: NSNumber?
    var altitude: NSNumber?
    var heading: NSNumber?
    let dateFormatterGet = DateFormatter()
    let groundSpeed = "500nm/hr"
    let bobrLargeText = "191/56"
    let bobrSmallText = "B/E: rock125"



    init(name: String, time: Date, latitude : NSNumber?, longitude : NSNumber?, altitude : NSNumber?, heading: NSNumber?){
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.name = name
        self.time = time
        if(latitude != nil){
            self.latitude = latitude!
        }
        if(longitude != nil){
            self.longitude = longitude!
        }
        if(altitude != nil){
            self.altitude = altitude!
        }
        if(heading != nil){
            self.heading = heading!
        }
    }
    
    func getEventName() -> String{
        return name
    }
    
    func getEventTime() -> String{
        return dateFormatterGet.string(from: time)
    }
    
    func getLatitude()->String{
        if(latitude != nil){
            return String(format: "N%.4f", latitude! as! Double)
        }else{
            return "123.65656"
        }
    }
    
    func getLongitude()->String{
        if(longitude != nil){
            return String(format: "W%.4f", longitude! as! Double)
        }else{
            return "66.65656"
        }
    }
    
    func getAltitude()->String{
        if(altitude != nil){
            return String(format: "%.1f ft", altitude! as! Double)
        }else{
            return "5000ft"
        }
    }
    
    func getBobrSmallText()->String{
        return bobrSmallText
    }
    
    func getBobrLargeText()->String{
        return bobrLargeText
    }
    
    func getGroundSpeed()->String{
        return groundSpeed
    }
    
    func getHeading()->String{
        if(heading != nil){
            return String(format: "%.f ", heading! as! Double)
        }else{
            return "120"
        }
    }
    
}

