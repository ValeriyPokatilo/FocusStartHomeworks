//
//  Car.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

struct Car {
	let manufacturer: String
	let model: String
	let body: Body
	let yearOfIssue: Int?
	let carNumber: String?

	func newCarPrint() {
		print("\(self.manufacturer) \(self.model) успешно добавлен в базу.")
		print("Количество автомобилей в базе - \(cars.count).")
	}
}
