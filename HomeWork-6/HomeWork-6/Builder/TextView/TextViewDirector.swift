//
//  TextViewDirector.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class TextViewDirector {
	private var textViewBuilder: TextViewBuilderProtocol

	init(textViewBuilder: TextViewBuilderProtocol) {
		self.textViewBuilder = textViewBuilder
	}

	func setBuilder(textViewBuilder: TextViewBuilderProtocol) {
		self.textViewBuilder = textViewBuilder
	}

	func createTextView() -> UITextView {
		self.textViewBuilder.setText()
		self.textViewBuilder.setBackgroundColor()
		self.textViewBuilder.setTextColor()

		return self.textViewBuilder.getResult()
	}
}
