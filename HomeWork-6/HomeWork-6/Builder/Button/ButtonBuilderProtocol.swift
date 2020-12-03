//
//  ButtonBuilderProtocol.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

protocol ButtonBuilderProtocol: AnyObject {
	func reset()

	func setTitle()
	func setBackgroundColor()
	func setCornerRadius()

	func getResult() -> UIButton
}
