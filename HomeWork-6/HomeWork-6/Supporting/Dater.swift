//
//  Dater.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import Foundation

struct Dater {
	static let shared = Dater()

	func returnDate() -> String {
		let currentDate = Date()
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm:ss"
		let dateString: String = formatter.string(from: currentDate)

		return dateString
	}
}
