//
//  MessageManager.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

struct MessageManager {
	static func separator() {
		print("-------------------------------------------------------")
	}

	static func welcomeMessage() {
		separator()
		print("Добро пожаловать!")
		print("Наберите help для получения справки по командам.")
		separator()
	}

	static func exitMessage() {
		separator()
		print("Сеанс окончен.")
		print("Спасибо что используете наше приложение!")
		separator()
	}

	static func helpMessages() {
		print("Список команд:")
		print("help - справка по командам")
		print("list - список автомобилей")
		print("filter - список автомобилей с фильром по типу кузова")
		print("add - добавить автомобиль")
		print("exit - выход их приложения")
	}

	static func unknownCommandMessage() {
		print("Неверная команда!")
		print("Наберите help для получения справки по командам.")
	}

	static func carShowMessage(car: Car) {
		separator()
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

	static func carEmptyMessage() {
		print("В базе пока нет ни одного автомобиля.")
		print("Для добавления автомобиля введите add.")
	}

	static func carEmptyBodyFilterMessage() {
		print("По заданным параметрам автомобилей не найдено.")
	}

	static func bodyTypeList() {
		print("Выберите тип кузова")
		print("1 - Седан")
		print("2 - Кроссовер")
		print("3 - Купе")
		print("4 - Кабриолет")
	}

	static func wrongBodyNumber() {
		print("Ошибка, введите вариант с 1 по 4")
	}
}
