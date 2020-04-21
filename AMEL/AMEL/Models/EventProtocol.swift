//
//  EventProtocol.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/15/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData

public protocol EventProtocol {
    var time:Date? { get set }
    var name:String? { get set }
    var latitude:NSNumber? { get set }
    var longitude:NSNumber? { get set }
    var altitude:NSNumber? { get set }
    var magneticHeading:NSNumber? { get set }
    var course:NSNumber? { get set }
    var color:String? { get set }
    var speed:NSNumber? { get set }
    static func getEvents() -> NSFetchRequest<Event>
    
}
