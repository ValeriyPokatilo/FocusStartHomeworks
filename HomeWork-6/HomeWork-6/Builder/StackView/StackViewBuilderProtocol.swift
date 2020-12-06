//
//  StackViewBuilderProtocol.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

protocol StackViewBuilderProtocol: AnyObject {
	func reset()

	func setFill()
	func setAxis()
	func setSpacing()

	func getResult() -> UIStackView
}
