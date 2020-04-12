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

struct EventFormatter{
    
    let event: Event
    
    func getName()->String {
        if(event.name != nil){
           return event.name!
       }else{
           return ""
       }
    }
    
    func getTime()->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss (dd-MMM-YY)"
        if(event.time != nil){
            return formatter.string(from: event.time!)
        }else{
            return "error"
        }
    }
    
    func getLatLng()->String {
        if(event.latitude != nil && event.longitude != nil){
            let formatter = LatLngFormatter(latitude: event.latitude as! Double, longitude: event.longitude as! Double)
            return formatter.getLatLng()
        }else{
            return "0"
        }
    }
    
    
    func getAltitude()->String{
        if(event.altitude != nil){
            let altitude =  String(format: "%d", Int(altToFeet(altMeters: event.altitude!)))
            return "Altitude: " + altitude + "ft HAE"
        }else{
            return "Altitude: unavailable"
        }
    }
    private func altToFeet(altMeters: NSNumber)->Double {
        return Double(truncating: altMeters) * 3.2808
    }
    
    func getColor() -> Color {
        if event.color != nil{
            do {
                return try Color(NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: event.color!)!)
            } catch {
                print(error)
            }
        }

        return Color.blue
    }

    func getUIColor() -> UIColor {
        if event.color != nil{
            do {
                return try (NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: event.color!)!)
            } catch {
                print(error)
            }
        }
        return UIColor.blue
    }
    func getHeadingCourse()->String {
        if(event.magneticHeading != nil && event.course != nil) {
            let heading = String(format: "%03d", Int(truncating: event.magneticHeading!))
            let course: String
            // only set course if it accurate, i.e it is positive
            if Int(truncating: event.course!) >= 0 {
                course = String(format: "%03d", Int(truncating: event.course!))
            }
            else {
               course = "---"
            }
            
            return "Heading/Course: " + heading + "°/" + course + "°"
        }
        else {
            return "Heading/Course: Unavailable"
        }
    }
    
    func getBoBR()->String {
        return "BoBR: 191/56 B/E rock 125"
    }
    func getGroundSpeed()->String {
        var groundSpeed = "Groundspeed: unavailable"
        if event.speed != nil{
            let speed = speedToNM(speedMPS: event.speed!)
            // set speed only if it is accurate, i.e positive
            if speed >= 0 {
                groundSpeed = "Groundspeed: " + String(format: "%d", Int(speed)) + " nm/hr"
            }
        }
        return groundSpeed
    }
    private func speedToNM(speedMPS: NSNumber)->Double {
        return Double(truncating: speedMPS) * 1.94384449412
    }
    
    // gets hex color from UIColor for use in log
    func getHexColor()->String {
        let uiColor = getUIColor()
        let components = uiColor.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
    }
}
