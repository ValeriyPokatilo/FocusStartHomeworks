//
//  CurrentValute.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import Foundation

struct CurrentValute: Decodable {
	let charCode: String
	let nominal: Int
	let name: String
	let value: Double
	let previous: Double
	var toUp: Bool {
		return value > previous ? true : false
	}
}
