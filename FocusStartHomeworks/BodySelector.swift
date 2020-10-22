//
//  BodySelector.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

final class BodySelector {
	static func enterBodyType() -> Body {
		var bodyNumber: String!
		var body = Body.Unknown
		
		let numberOptions = ["1", "2", "3", "4"]

		while body == Body.Unknown {

			MessageManager.bodyTypeList()
			bodyNumber = readLine()

			switch bodyNumber {
			case numberOptions[0]: body = Body.Sedan
			case numberOptions[1]: body = Body.SUV
			case numberOptions[2]: body = Body.Coupe
			case numberOptions[3]: body = Body.Сabriolet
			default: body = Body.Unknown
			}

			if !numberOptions.contains(bodyNumber) {
				MessageManager.wrongBodyNumber()
			}
		}

		return body
	}
}
