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
		flagImage.image = UIImage()

		//nameLabel.text = "RUR"
		nameLabel.font = Font.headerStyle.font

		//countryLabel.text = "Российский рубль"
		countryLabel.font = Font.textStyle.font
		countryLabel.adjustsFontSizeToFitWidth = true
		countryLabel.minimumScaleFactor = 0.4

		//valueTextField.text = "1" // номминал
		valueTextField.font = Font.textStyle.font
		valueTextField.textAlignment = .right
		valueTextField.borderStyle = .roundedRect
		valueTextField.keyboardType = .numberPad
		valueTextField.returnKeyType = .done

		setupViewsLayout()
	}

	func setupViewsLayout() {
		let safeArea = self.safeAreaLayoutGuide

		flagImage.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(flagImage)
		NSLayoutConstraint.activate([
			flagImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
			flagImage.heightAnchor.constraint(equalToConstant: 100),
			flagImage.widthAnchor.constraint(equalToConstant: 100),
			flagImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
			flagImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])

//		nameLabel.translatesAutoresizingMaskIntoConstraints = false
//		self.addSubview(nameLabel)
//		NSLayoutConstraint.activate([
//			nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
//			nameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 16)
//		])

		countryLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(countryLabel)
		NSLayoutConstraint.activate([
			countryLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 28),
			countryLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 16)
		])

		valueTextField.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(valueTextField)
		NSLayoutConstraint.activate([
			valueTextField.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 12),
			valueTextField.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 16),
			valueTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
		])


		NSLayoutConstraint.activate([
			self.bottomAnchor.constraint(equalTo: flagImage.bottomAnchor)
		])	}
}
