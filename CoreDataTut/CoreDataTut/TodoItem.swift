//
//  TodoItem.swift
//  CoreDataTut
//
//  Created by Neil Marcellini on 2/20/20.
//  Copyright © 2020 Neil Marcellini. All rights reserved.
//

import Foundation
import CoreData

public class TodoItem : NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension TodoItem {
    static func getAllTodoItems() -> NSFetchRequest<TodoItem> {
        let request:NSFetchRequest<TodoItem> = TodoItem.fetchRequest() as! NSFetchRequest<TodoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
