//
//  UserDefManager.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import Foundation
final class UserDefManager {
	static let shared = UserDefManager()
	private let defaults = UserDefaults.standard

	func saveStringValue(value: String, key: String) {
		defaults.set(value, forKey: key)
	}

	func readStringValue(for key: String) -> String {
		if let stringValue = defaults.value(forKey: key) as? String {
			return stringValue
		} else {
			return ""
		}
	}
}
