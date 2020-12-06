//
//  LabelBuilderProtocol.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

protocol LabelBuilderProtocol: AnyObject {
	func reset()

	func setAlignment()
	func setText()
	func setTextColor()
	func setBackgroundColor()

	func getResult() -> UILabel
}
