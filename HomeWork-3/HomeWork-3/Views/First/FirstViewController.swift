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
		firstView.button1.layer.cornerRadius = firstView.button1.bounds.height / 2
		firstView.button2.layer.cornerRadius = 8
	}
}

