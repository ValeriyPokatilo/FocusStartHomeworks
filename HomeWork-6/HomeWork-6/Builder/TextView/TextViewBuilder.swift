//
//  TextViewBuilder.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class TextViewBuilder: TextViewBuilderProtocol {
	private var textView: UITextView = UITextView()

	func reset() {
		self.textView = UITextView()
	}

	func setText() {
		self.textView.text = "The application is running\n"
	}

	func setBackgroundColor() {
		self.textView.backgroundColor = UIColor.black
	}

	func setTextColor() {
		self.textView.textColor = UIColor.white
	}

	func getResult() -> UITextView {
		return textView
	}
}
