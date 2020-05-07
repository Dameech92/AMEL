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
    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var time: Date?
    @NSManaged public var isActive: Bool
}
extension ReferencePoint {
    static func getPoints() -> NSFetchRequest<ReferencePoint> {
        let request: NSFetchRequest<ReferencePoint> = ReferencePoint.fetchRequest() as! NSFetchRequest<ReferencePoint>
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    

}
