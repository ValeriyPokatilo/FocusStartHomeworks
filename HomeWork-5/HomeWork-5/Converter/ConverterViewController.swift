//
//  ConverterViewController.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import UIKit

class ConverterViewController: UIViewController {

	let roubleValuteView = CountryView()
	let anotherValuteView = CountryView()

	var valute: String = "" // ???

    override func viewDidLoad() {
        super.viewDidLoad()
		setupViews()
    }
}

// Setup views

private extension ConverterViewController {
	func setupViews() {
		self.view.backgroundColor = .white

		setupViewsLayout()
	}

	func setupViewsLayout() {
		self.view.addSubview(roubleValuteView)
		roubleValuteView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			roubleValuteView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			roubleValuteView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			roubleValuteView.topAnchor.constraint(equalTo: self.view.topAnchor)
		])

		self.view.addSubview(anotherValuteView)
		anotherValuteView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			anotherValuteView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			anotherValuteView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			anotherValuteView.topAnchor.constraint(equalTo: self.roubleValuteView.bottomAnchor, constant: 32)
		])
	}
}
