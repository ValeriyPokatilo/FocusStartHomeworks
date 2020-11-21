//
//  ButtonBuilder.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class ButtonBuilder: ButtonBuilderProtocol {
	private var button: UIButton = UIButton()

	func reset() {
		self.button = UIButton()
	}

	func setTitle() {
		self.button.setTitle("Ping", for: .normal)
	}

	func setBackgroundColor() {
		self.button.backgroundColor = UIColor.systemBlue
	}

	func setCornerRadius() {
		self.button.layer.cornerRadius = 3
	}

	func getResult() -> UIButton {
		return self.button
	}
}
