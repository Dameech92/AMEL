//
//  CustomButton.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 4/14/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import Foundation
import SwiftUI
import CoreData

public class CustomButton: NSManagedObject, Identifiable {
    @NSManaged var buttonName:String?
    @NSManaged var buttonColor:UIColor?
    @NSManaged var index:NSNumber?
}
extension CustomButton {
    static func getCustomButton() -> NSFetchRequest<CustomButton> {
        let request: NSFetchRequest<CustomButton> = CustomButton.fetchRequest() as! NSFetchRequest<CustomButton>
        let sortDescriptor = NSSortDescriptor(key: "index", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
