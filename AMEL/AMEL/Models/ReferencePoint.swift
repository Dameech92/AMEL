//
//  Point.swift
//  AMEL
//
//  Created by MacOSCatalina on 4/16/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData

public class ReferencePoint: NSManagedObject, Identifiable {
    @NSManaged public var northSouth:String?
    @NSManaged public var lat:NSNumber?
    @NSManaged public var eastWest:String?
    @NSManaged public var lng:NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var time: Date?
}
extension ReferencePoint {
    static func getPoints() -> NSFetchRequest<ReferencePoint> {
        let request: NSFetchRequest<ReferencePoint> = ReferencePoint.fetchRequest() as! NSFetchRequest<ReferencePoint>
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    

}
