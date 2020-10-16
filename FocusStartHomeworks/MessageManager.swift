//
//  MessageManager.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

import Foundation

class MessageManager {

	static let shared = MessageManager()

	func separator() {
		print("-------------------------------------------------------")
	}

	func welcomeMessage() {

		separator()
		print("Добро пожаловать!")
		print("Наберите help для получения справки по командам.")
		separator()
	}

	func exitMessage() {

		separator()
		print("Сеанс окончен.")
		print("Спасибо что используете наше приложение!")
		separator()
	}

	func helpMessages() {

		print("Список команд:")
		print("help - справка по командам")
		print("ls - список автомобилей")
		print("ls -body - список автомобилей с фильром по типу кузова")
		print("add - добавить автомобиль")
	}

	func unknownCommandMessage() {

		print("Неверная команда!")
		print("Наберите help для получения справки по командам.")
	}

	func carShowMessage(car: Car) {

		MessageManager.shared.separator()
		print("Производитель: \(car.manufacturer)")
		print("Модель:        \(car.model)")
		print("Тип кузова:    \(car.body)")
		if let yearOfIssue = car.yearOfIssue {
			print("Год выпуска:   \(yearOfIssue)")
		} else {
			print("Год выпуска:   -")
		}
		if let carNumber = car.carNumber {
			print("Гос номер:     \(carNumber)")
		}
	}

	func carEmptyMessage() {

		print("В базе пока нет ни одного автомобиля.")
		print("Для добавления автомобиля введите add.")
	}

	func carEmptyBodyFilterMessage() {

		print("По заданным параметрам автомобилей не найдено.")
	}

	func bodyTypeList() {

		print("Выберите тип кузова")
		print("1 - Седан")
		print("2 - Кроссовер")
		print("3 - Купе")
		print("4 - Кабриолет")
	}

	func wrongBodyNumber() {

		print("Неверный тип кузова, введите еще раз")
	}

	func carAddedMessage(manufactirer: String, model: String) {

		print("\(manufactirer) \(model) успешно добавлен в базу.")
		print("В базе \(cars.count) автомобилей.")
	}
}
