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

// MARK: - Setup views

extension CurrencyCell {
	func setupViews(valute: Valute) {
		self.nameLabel.text = valute.CharCode
		self.nameLabel.font = Font.headerStyle.font

		self.countryLabel.text = valute.Name
		self.countryLabel.font = Font.textStyle.font
		self.countryLabel.adjustsFontSizeToFitWidth = true
		self.countryLabel.minimumScaleFactor = 0.4

		let longValue = valute.Value ?? 0
		let value = String(format: "%.2f", longValue)
		self.resultStringLabel.text = "\(value) руб. за \(valute.Nominal ?? 0) \(valute.CharCode ?? "")"
		self.resultStringLabel.font = Font.dateStyle.font

		self.flagImage.image = UIImage(named: valute.CharCode ?? "nophoto")

		switch valute.toUp {
		case true:
			self.toUpImage.tintColor = .green
			self.toUpImage.image = SystemImage.up.image
		case false:
			self.toUpImage.tintColor = .red
			self.toUpImage.image = SystemImage.down.image
		}

		self.setupViewsLayout()
	}

	func setupViewsLayout() {
		self.flagImage.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.flagImage)
		NSLayoutConstraint.activate([
			self.flagImage.heightAnchor.constraint(equalToConstant: 100),
			self.flagImage.widthAnchor.constraint(equalToConstant: 100),
			self.flagImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
			self.flagImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])

		self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.nameLabel)
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
			nameLabel.leadingAnchor.constraint(equalTo: self.flagImage.trailingAnchor, constant: 16)
		])

		self.toUpImage.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.toUpImage)
		NSLayoutConstraint.activate([
			self.toUpImage.leadingAnchor.constraint(equalTo: self.flagImage.trailingAnchor, constant: 70),
			self.toUpImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
			self.toUpImage.heightAnchor.constraint(equalToConstant: 22),
			self.toUpImage.widthAnchor.constraint(equalToConstant: 22)
		])

		self.countryLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.countryLabel)
		NSLayoutConstraint.activate([
			self.countryLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 3),
			self.countryLabel.leadingAnchor.constraint(equalTo: self.flagImage.trailingAnchor, constant: 16),
			self.countryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
		])

		self.resultStringLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.resultStringLabel)
		NSLayoutConstraint.activate([
			self.resultStringLabel.topAnchor.constraint(equalTo: self.countryLabel.bottomAnchor, constant: 3),
			self.resultStringLabel.leadingAnchor.constraint(equalTo: self.flagImage.trailingAnchor, constant: 16)
		])
	}
}
