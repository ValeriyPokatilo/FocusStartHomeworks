//
//  SwitchDirector.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class SwitchDirector {
	private var switchFieldBuilder: SwitchBuilderProtocol

	init(switchFieldBuilder: SwitchBuilderProtocol) {
		self.switchFieldBuilder = switchFieldBuilder
	}

	func setBuilder(switchFieldBuilder: SwitchBuilderProtocol) {
		self.switchFieldBuilder = switchFieldBuilder
	}

	func createSwitch() -> UISwitch {
		self.switchFieldBuilder.reset()
		return self.switchFieldBuilder.getResult()
	}
}
