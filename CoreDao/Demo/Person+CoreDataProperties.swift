//
//  Person+CoreDataProperties.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    @NSManaged public var name: String?
    @NSManaged public var age: String?

}
