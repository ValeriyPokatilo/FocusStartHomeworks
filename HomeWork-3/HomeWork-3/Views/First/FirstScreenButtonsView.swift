//
//  FirstScreenButtonsView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 30.10.2020.
//

import UIKit

final class FirstScreenButtonsView: UIView {
	init(button1: UIButton, button2: UIButton) {
		super.init(frame: .zero)

		button1.translatesAutoresizingMaskIntoConstraints = false
		button2.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(button1)
		self.addSubview(button2)

		NSLayoutConstraint.activate([
			button1.topAnchor.constraint(equalTo: self.topAnchor),
			button1.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			button1.heightAnchor.constraint(equalToConstant: 50),
			button1.widthAnchor.constraint(equalToConstant: 50)
		])

		NSLayoutConstraint.activate([
			button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
			button2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			button2.heightAnchor.constraint(equalToConstant: 50),
			button2.widthAnchor.constraint(equalToConstant: 200)
		])

		NSLayoutConstraint.activate([
			self.bottomAnchor.constraint(equalTo: button2.bottomAnchor)
		])

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
