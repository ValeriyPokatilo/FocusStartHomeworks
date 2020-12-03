//
//  SwithBuilder.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class SwithBuilder: SwitchBuilderProtocol {
	private var switcher: UISwitch = UISwitch()

	func reset() {
		self.switcher = UISwitch()
	}

	func getResult() -> UISwitch {
		return self.switcher
	}
}
