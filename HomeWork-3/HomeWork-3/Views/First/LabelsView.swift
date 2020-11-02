//
//  LabelsView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 30.10.2020.
//

import UIKit

final class LabelsView: UIView {
	init(label1: UILabel, label2: UILabel, label3: UILabel) {
		super.init(frame: .zero)

		// Label 1
		self.addSubview(label1)
		label1.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label1.topAnchor.constraint(equalTo: self.topAnchor),
			label1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			label1.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])

		// Label 2
		self.addSubview(label2)
		label2.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
			label2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			label2.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])

		// Label 3
		self.addSubview(label3)
		label3.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20),
			label3.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			label3.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])

		// Self
		NSLayoutConstraint.activate([
			self.bottomAnchor.constraint(equalTo: label3.bottomAnchor)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

