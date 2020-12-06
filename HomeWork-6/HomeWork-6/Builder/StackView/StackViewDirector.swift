//
//  StackViewDirector.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class StackViewDirector {
	private var stackViewBuilder: StackViewBuilderProtocol

	init(stackViewBuilder: StackViewBuilderProtocol) {
		self.stackViewBuilder = stackViewBuilder
	}

	func setBuilder(stackViewBuilder: StackViewBuilderProtocol) {
		self.stackViewBuilder = stackViewBuilder
	}

	func createStackView() -> UIStackView {
		self.stackViewBuilder.setFill()
		self.stackViewBuilder.setAxis()
		self.stackViewBuilder.setSpacing()

		return self.stackViewBuilder.getResult()
	}
}
