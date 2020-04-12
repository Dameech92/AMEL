//
//  UserSetting.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/12/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData

public class UserSetting: NSManagedObject, Identifiable {
	@NSManaged public var buttonNames: [String]?
	@NSManaged public var initialSetup: NSNumber?
}
extension UserSetting {
    static func getUserSettings() -> NSFetchRequest<UserSetting> {
        let request: NSFetchRequest<UserSetting> = UserSetting.fetchRequest() as! NSFetchRequest<UserSetting>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    

}
