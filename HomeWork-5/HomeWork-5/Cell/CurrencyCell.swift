//
//  CurrencyCell.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import UIKit

class CurrencyCell: UITableViewCell {

	// MARK: - Properties

	var nameLabel = UILabel()
	var resultStringLabel = UILabel()
	var countryLabel = UILabel()
	var toUpImage = UIImageView()
	var flagImage = UIImageView()

	// MARK: - Functions

	func cellConfigure(valute: Valute) {
		setupViews(valute: valute)
	}

}

extension CurrencyCell {
	func setupViews(valute: Valute) {
		nameLabel.text = valute.CharCode
		nameLabel.font = Font.headerStyle.font

		countryLabel.text = valute.Name
		countryLabel.font = Font.textStyle.font
		countryLabel.adjustsFontSizeToFitWidth = true
		countryLabel.minimumScaleFactor = 0.4

		let longValue = valute.Value ?? 0
		let value = String(format: "%.2f", longValue)
		resultStringLabel.text = "\(value) руб. за \(valute.Nominal ?? 0) \(valute.CharCode ?? "")"
		resultStringLabel.font = Font.dateStyle.font

		flagImage.image = UIImage(named: valute.CharCode ?? "nophoto")

		switch valute.toUp {
		case true:
			toUpImage.tintColor = .green
			toUpImage.image = SystemImage.up.image
		case false:
			toUpImage.tintColor = .red
			toUpImage.image = SystemImage.down.image
		}

		setupViewsLayout()
	}

	func setupViewsLayout() {
		flagImage.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(flagImage)
		NSLayoutConstraint.activate([
			flagImage.heightAnchor.constraint(equalToConstant: 100),
			flagImage.widthAnchor.constraint(equalToConstant: 100),
			flagImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
			flagImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])

		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(nameLabel)
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
			nameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 16)
		])

		toUpImage.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(toUpImage)
		NSLayoutConstraint.activate([
			toUpImage.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 70),
			toUpImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
			toUpImage.heightAnchor.constraint(equalToConstant: 22),
			toUpImage.widthAnchor.constraint(equalToConstant: 22)
		])

		countryLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(countryLabel)
		NSLayoutConstraint.activate([
			countryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
			countryLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 16)
		])

		resultStringLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(resultStringLabel)
		NSLayoutConstraint.activate([
			resultStringLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 3),
			resultStringLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 16)
		])
	}
}
