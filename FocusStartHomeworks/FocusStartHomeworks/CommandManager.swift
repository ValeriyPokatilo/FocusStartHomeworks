//
//  CommandManager.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

final class CommandManager {
	static func add() {
		let car = CarCreator.addCar()
		cars.append(car)
		car.newCarPrint()
		MessageManager.separator()
	}

	static func unknown() {
		MessageManager.unknownCommandMessage()
		MessageManager.separator()
	}

	static func help() {
		MessageManager.helpMessages()
		MessageManager.separator()
	}

	static func list() {
		if cars.count != 0 {
			for car in cars {
				MessageManager.carShowMessage(car: car)
			}
		} else {
			MessageManager.carEmptyMessage()
		}
		MessageManager.separator()
	}

	static func filteredList() {
		let body = BodySelector.enterBodyType()


		let filtredCars = cars.filter {
			$0.body == body
		}

		if filtredCars.count == 0 {
			MessageManager.carEmptyBodyFilterMessage()
		} else {
			for car in filtredCars {
				MessageManager.carShowMessage(car: car)
			}
		}

		MessageManager.separator()
	}
}
