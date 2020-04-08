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
           return "Missile"
       }
    }
    
    func getTime()->String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        if(event.time != nil){
            return formatter.string(from: event.time!)
        }else{
            return "Now"
        }
    }
    
    func getLatitude()->String {
        if(event.latitude != nil){
            return String(format: "N%.4f", event.latitude! as! Double)
        }else{
            return "123.65656"
        }
    }
    
    func getLongitude()->String{
        if(event.longitude != nil){
            return String(format: "W%.4f", event.longitude! as! Double)
        }else{
            return "66.65656"
        }
    }
    
    func getAltitude()->String{
        if(event.altitude != nil){
            return String(format: "%.1f ft", event.altitude! as! Double)
        }else{
            return "5000ft"
        }
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
    func getHeading()->String{
        if(event.magneticHeading != nil){
            return String(format: "%.f ", event.magneticHeading! as! Double)
        }else{
            return "120"
        }
    }
    func getBoBR()->String {
        return "BoBR: 191/56 B/E rock 125"
    }
    func getGroundSpeed()->String {
        return "543 nm/hr"
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
