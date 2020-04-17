//
//  Point.swift
//  AMEL
//
//  Created by MacOSCatalina on 4/16/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData

public class Point: NSManagedObject, Identifiable {
    @NSManaged public var ns:String?
    @NSManaged public var lat:NSNumber?
    @NSManaged public var ew:String?
    @NSManaged public var lng:NSNumber?
}
extension Point {
    static func getPoints() -> NSFetchRequest<Point> {
        let request: NSFetchRequest<Point> = Point.fetchRequest() as! NSFetchRequest<Point>
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    

}
