//
//  BodySelector.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

import Foundation

class BodySelector {
	static let shared = BodySelector()

	func enterBodyType() -> Body {
		var bodyNumber: String!
		var body = Body.Unknow

		while body == Body.Unknow {

			MessageManager.shared.bodyTypeList()
			bodyNumber = readLine()

			switch bodyNumber {
			case "1": body = Body.Sedan
			case "2": body = Body.SUV
			case "3": body = Body.Coupe
			case "4": body = Body.Сabriolet
			default: body = Body.Unknow
			}
		}

		return body
	}
}
