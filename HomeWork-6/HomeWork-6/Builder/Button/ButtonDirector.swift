//
//  ButtonDirector.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class ButtonDirector {
	private var buttonBuilder: ButtonBuilderProtocol

	init(buttonBuilder: ButtonBuilderProtocol) {
		self.buttonBuilder = buttonBuilder
	}

	func setBuilder(buttonBuilder: ButtonBuilderProtocol) {
		self.buttonBuilder = buttonBuilder
	}

	func createButton() -> UIButton {
		self.buttonBuilder.reset()
		self.buttonBuilder.setTitle()
		self.buttonBuilder.setBackgroundColor()
		self.buttonBuilder.setCornerRadius()

		return self.buttonBuilder.getResult()
	}
}
