//
//  Event.swift
//
//  Created by Zins, Richard on 3/2/20.
//  Copyright © 2020 Zins, Richard. All rights reserved.

import Foundation
import CoreData

public class Event: NSManagedObject, Identifiable {
    @NSManaged public var  time:Date?
    @NSManaged public var name:String?
    @NSManaged public var latitude:NSNumber?
    @NSManaged public var longitude:NSNumber?
    @NSManaged public var altitude:NSNumber?
    @NSManaged public var magneticHeading:NSNumber?
}
extension Event {
    static func getEvents() -> NSFetchRequest<Event> {
        let request: NSFetchRequest<Event> = Event.fetchRequest() as! NSFetchRequest<Event>
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    

}
