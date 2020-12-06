//
//  LabelDirector.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class LabelDirector {
	private var labelBuilder: LabelBuilderProtocol

	init(labelBuilder: LabelBuilderProtocol) {
		self.labelBuilder = labelBuilder
	}

	func setBuilder(labelBuilder: LabelBuilderProtocol) {
		self.labelBuilder = labelBuilder
	}

	func createLabel() -> UILabel {
		self.labelBuilder.reset()
		self.labelBuilder.setAlignment()
		self.labelBuilder.setText()
		self.labelBuilder.setTextColor()
		self.labelBuilder.setBackgroundColor()

		return self.labelBuilder.getResult()
	}
}
