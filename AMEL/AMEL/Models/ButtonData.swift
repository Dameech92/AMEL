//
//  ButtonData.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData

public class ButtonData:  NSManagedObject, Identifiable {

        @NSManaged public var time:Date?
        @NSManaged public var color:Data?
        @NSManaged public var name:String?
    }
    extension ButtonData {
        
            static func getAllButtonData() -> NSFetchRequest<ButtonData> {
                let request: NSFetchRequest<ButtonData> = Event.fetchRequest() as! NSFetchRequest<ButtonData>
                let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
                request.sortDescriptors = [sortDescriptor]
            return request
        }
}
