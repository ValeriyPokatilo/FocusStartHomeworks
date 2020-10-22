//
//  Cars.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 22.10.2020.
//

final class Cars {
	static let shared = Cars(cars: [Car]())

	var cars: [Car]

	init(cars: [Car]) {
		self.cars = cars
	}
}
