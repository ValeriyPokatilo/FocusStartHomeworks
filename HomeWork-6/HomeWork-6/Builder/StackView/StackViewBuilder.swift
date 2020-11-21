//
//  StackViewBuilder.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class StackViewBuilder: StackViewBuilderProtocol {
	private var stackView: UIStackView = UIStackView()

	func reset() {
		self.stackView = UIStackView()
	}

	func setFill() {
		self.stackView.alignment = UIStackView.Alignment.center
	}

	func setAxis() {
		self.stackView.axis = NSLayoutConstraint.Axis.vertical
	}

	func setSpacing() {
		self.stackView.spacing = 10
	}

	func getResult() -> UIStackView {
		return self.stackView
	}
}
