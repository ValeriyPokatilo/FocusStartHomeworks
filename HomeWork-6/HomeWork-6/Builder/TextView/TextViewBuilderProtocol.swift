//
//  TextViewBuilderProtocol.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

protocol TextViewBuilderProtocol: AnyObject {
	func reset()

	func setText()
	func setBackgroundColor()
	func setTextColor()

	func getResult() -> UITextView
}
