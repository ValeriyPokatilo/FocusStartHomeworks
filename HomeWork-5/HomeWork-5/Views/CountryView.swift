//
//  CountryView.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import UIKit

final class CountryView: UIView {

	// MARK: - Properties
	let nameLabel = UILabel()
	let countryLabel = UILabel()
	let flagImage = UIImageView()
	let valueTextField = UITextField()

	init() {
		super.init(frame: .zero)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

extension CountryView {
	func setupViews() {
		self.flagImage.image = UIImage()

		self.nameLabel.font = Font.headerStyle.font

		self.countryLabel.font = Font.textStyle.font
		self.countryLabel.adjustsFontSizeToFitWidth = true
		self.countryLabel.minimumScaleFactor = 0.4

		self.valueTextField.font = Font.textStyle.font
		self.valueTextField.textAlignment = .right
		self.valueTextField.borderStyle = .roundedRect
		self.valueTextField.keyboardType = .numberPad
		self.valueTextField.returnKeyType = .done

		self.setupViewsLayout()
	}

	func setupViewsLayout() {
		let safeArea = self.safeAreaLayoutGuide

		self.flagImage.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.flagImage)
		NSLayoutConstraint.activate([
			self.flagImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
			self.flagImage.heightAnchor.constraint(equalToConstant: 100),
			self.flagImage.widthAnchor.constraint(equalToConstant: 100),
			self.flagImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
			self.flagImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])

		self.countryLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.countryLabel)
		NSLayoutConstraint.activate([
			self.countryLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 28),
			self.countryLabel.leadingAnchor.constraint(equalTo: self.flagImage.trailingAnchor, constant: 16),
			self.countryLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
		])

		self.valueTextField.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.valueTextField)
		NSLayoutConstraint.activate([
			self.valueTextField.topAnchor.constraint(equalTo: self.countryLabel.bottomAnchor, constant: 12),
			self.valueTextField.leadingAnchor.constraint(equalTo: self.flagImage.trailingAnchor, constant: 16),
			self.valueTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
		])


		NSLayoutConstraint.activate([
			self.bottomAnchor.constraint(equalTo: self.flagImage.bottomAnchor)
		])
	}
}
