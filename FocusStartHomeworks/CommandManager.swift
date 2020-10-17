//
//  CommandManager.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

import Foundation

class CommandManager {
	static let shared = CommandManager()

	func add() {
		let car = CarCreator.shared.addCar()
		cars.append(car)
		car.newCarPrint()
		MessageManager.shared.separator()
	}

	func unknown() {
		MessageManager.shared.unknownCommandMessage()
		MessageManager.shared.separator()
	}

	func help() {
		MessageManager.shared.helpMessages()
		MessageManager.shared.separator()
	}

	func ls() {
		if cars.count != 0 {
			for car in cars {
				MessageManager.shared.carShowMessage(car: car)
			}
		} else {
			MessageManager.shared.carEmptyMessage()
		}
		MessageManager.shared.separator()
	}

	func lsFilter() {
		let body = BodySelector.shared.enterBodyType()

		var counter = 0

		for car in cars {
			if car.body == body {
				MessageManager.shared.carShowMessage(car: car)
				counter += 1
			}
		}

		if counter == 0 {
			MessageManager.shared.carEmptyBodyFilterMessage()
		}

		MessageManager.shared.separator()
	}
}
