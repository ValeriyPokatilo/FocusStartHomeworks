//
//  Person+CoreDataProperties.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import Foundation
import CoreData


extension Person {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
		return NSFetchRequest<Person>(entityName: "Person")
	}

	@NSManaged public var age: Int64
	@NSManaged public var education: String?
	@NSManaged public var experience: Int64
	@NSManaged public var name: String?
	@NSManaged public var position: String?
	@NSManaged public var company: Company?

}

extension Person : Identifiable {

}
