//
//  CarCreator.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

import Foundation

class CarCreator {
	static let shared = CarCreator()

	func addCar() -> Car {
		MessageManager.shared.separator()
		print("Добавление нового автомобиля")

		let car = Car(manufacturer: enterStringData(field: "производителя"),
					  model: enterStringData(field: "модель"),
					  body: BodySelector.shared.enterBodyType(),
					  yearOfIssue: enterIntData(field: "год выпуска"),
					  carNumber: enterOptStringData(field: "гос номер"))

		return car
	}

	func enterStringData(field: String) -> String {
		var value = ""

		while value.isEmpty {
			print("Введите \(field) автомобиля")
			value = readLine() ?? ""
		}

		return value
	}

	func enterOptStringData(field: String) -> String? {
		print("Введите \(field) автомобиля")
		let carNumber = readLine()

		if carNumber == "" {
			return nil
		} else {
			return carNumber
		}
	}

	func enterIntData(field: String) -> Int? {
		print("Введите \(field) автомобиля")
		let yearOfIssue = readLine()

		if let year = Int(yearOfIssue ?? ""), year != 0 {
			return year
		} else {
			return nil
		}
	}
}
