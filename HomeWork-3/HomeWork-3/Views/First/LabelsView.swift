//
//  LabelsView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 30.10.2020.
//

import UIKit

final class LabelsView: UIView {
	init(smallFontLabel: UILabel, middleFontLabel: UILabel, bigFontLabel: UILabel) {
		super.init(frame: .zero)

		// Label 1
		self.addSubview(smallFontLabel)
		smallFontLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			smallFontLabel.topAnchor.constraint(equalTo: self.topAnchor),
			smallFontLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			smallFontLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])

		// Label 2
		self.addSubview(middleFontLabel)
		middleFontLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			middleFontLabel.topAnchor.constraint(equalTo: smallFontLabel.bottomAnchor, constant: 10),
			middleFontLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			middleFontLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])

		// Label 3
		self.addSubview(bigFontLabel)
		bigFontLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			bigFontLabel.topAnchor.constraint(equalTo: middleFontLabel.bottomAnchor, constant: 20),
			bigFontLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			bigFontLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])

		// Self
		NSLayoutConstraint.activate([
			self.bottomAnchor.constraint(equalTo: bigFontLabel.bottomAnchor)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

