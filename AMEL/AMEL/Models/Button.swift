//
//  ButtonList.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData

public class Button:  NSManagedObject, Identifiable {

        @NSManaged public var  time:Date?
        @NSManaged public var color:Data?
        @NSManaged public var name:String?
    }
    extension Button {
        
            static func getButtons() -> NSFetchRequest<Button> {
                let request: NSFetchRequest<Button> = Event.fetchRequest() as! NSFetchRequest<Button>
                let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
                request.sortDescriptors = [sortDescriptor]
            return request
        }
}
