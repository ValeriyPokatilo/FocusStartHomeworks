//
//  CoreDataManager.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit
import CoreData

struct CoreDataManager {
	static let shared = CoreDataManager()

	private let manageContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	func addCompany(_ name: String) -> Company? {
		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Company", in: manageContext)
			else { return nil }
		let company = NSManagedObject(entity: entityDescription, insertInto: manageContext) as! Company

		company.brand = name

		do {
			try manageContext.save()
			return company
		} catch let error {
			print(error.localizedDescription)
			return nil
		}
	}

	func fetchCompanys() -> [Company] {
		var companys = [Company]()
		let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()

		do {
			companys = try manageContext.fetch(fetchRequest)
		} catch let error {
			print(error.localizedDescription)
		}

		return companys
	}

	func addPerson(company: Company,
				   name: String,
				   age: Int,
				   experience: Int,
				   education: String,
				   position: String) {

		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: manageContext)
			else { return }
		let personEntity = NSManagedObject(entity: entityDescription, insertInto: manageContext) as! Person

		personEntity.name = name
		personEntity.age = Int64(age)
		personEntity.experience = Int64(experience)
		personEntity.education = education
		personEntity.position = position
		personEntity.company = company

		do {
			try manageContext.save()
		} catch let error {
			print(error.localizedDescription)
		}
	}

	func savePerson(person: Person,
					name: String,
					age: Int,
					experience: Int,
					education: String,
					position: String) {

		person.name = name
		person.age = Int64(age)
		person.experience = Int64(experience)
		person.education = education
		person.position = position

		do {
			try manageContext.save()
		} catch let error {
			print(error.localizedDescription)
		}
	}

	func fetchPersons(company: Company) -> [Person] {
		var persons = [Person]()

		let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
		fetchRequest.predicate = NSPredicate(format: "company == %@", company)

		do {
			persons = try manageContext.fetch(fetchRequest)
		} catch let error {
			print(error.localizedDescription)
		}

		return persons
	}
}
