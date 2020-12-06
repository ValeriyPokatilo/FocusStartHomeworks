//
//  LabelBuilder.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class LabelBuilder: LabelBuilderProtocol {
	private var label: UILabel = UILabel()

	func reset() {
		self.label = UILabel()
	}

	func setAlignment() {
		self.label.textAlignment = .center
	}

	func setText() {
		self.label.text = "Internet connection"
	}

	func setTextColor() {
		self.label.textColor = UIColor.black
	}

	func setBackgroundColor() {
		self.label.backgroundColor = UIColor.systemBackground
	}

	func getResult() -> UILabel {
		return self.label
	}
}
