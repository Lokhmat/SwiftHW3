//
//  Alarm+CoreDataProperties.swift
//  splokhmatikovPW3
//
//  Created by Sergey Lokhmatikov on 31.12.2021.
//
//

import Foundation
import CoreData


extension Alarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alarm> {
        return NSFetchRequest<Alarm>(entityName: "Alarm")
    }

    @NSManaged public var time: Int32
    @NSManaged public var descriptionLabel: String
    @NSManaged public var isOn: Bool

}

extension Alarm : Identifiable {

}
