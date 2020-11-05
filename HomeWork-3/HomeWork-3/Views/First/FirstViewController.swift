//
//  FirstViewController.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 29.10.2020.
//

import UIKit
 class FirstViewController: UIViewController {

	// Properties

	let firstView = FirstScreenView()

	// MARK: - Lifecycle

	override func loadView() {
		self.view = firstView
	}

	override func viewWillLayoutSubviews() {
		firstView.circleButton.layer.cornerRadius = firstView.circleButton.bounds.height / 2
		firstView.rectangleButton.layer.cornerRadius = Metrics.smallVerticalSpace.rawValue
	}
}

