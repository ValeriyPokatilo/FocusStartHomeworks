//
//  ButtonsView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 30.10.2020.
//

import UIKit

final class ButtonsView: UIView {
	init(circleButton: UIButton, rectangleButton: UIButton) {
		super.init(frame: .zero)

		// Button 1
		self.addSubview(circleButton)
		circleButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			circleButton.topAnchor.constraint(equalTo: self.topAnchor),
			circleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			circleButton.heightAnchor.constraint(equalToConstant: 50),
			circleButton.widthAnchor.constraint(equalToConstant: 50)
		])

		// Button 2
		self.addSubview(rectangleButton)
		rectangleButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			rectangleButton.topAnchor.constraint(equalTo: circleButton.bottomAnchor, constant: 20),
			rectangleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			rectangleButton.heightAnchor.constraint(equalToConstant: 50),
			rectangleButton.widthAnchor.constraint(equalToConstant: 200)
		])

		// Self
		NSLayoutConstraint.activate([
			self.bottomAnchor.constraint(equalTo: rectangleButton.bottomAnchor)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
