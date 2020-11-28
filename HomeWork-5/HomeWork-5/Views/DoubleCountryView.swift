//
//  DoubleCountryView.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 28.11.2020.
//

import UIKit

final class DoubleCountryView: UIView {

	// MARK: - Properties

	private var roubleValuteView = CountryView()
	private var anotherValuteView = CountryView()

	// MARK: - Lifecycle

	init(anotherValute: AnotherValute) {
		super.init(frame: .zero)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension DoubleCountryView {
	func setupViews() {
		self.setupViewsLayout()
	}

	func setupViewsLayout() {
		self.addSubview(roubleValuteView)
		roubleValuteView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			roubleValuteView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			roubleValuteView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			roubleValuteView.topAnchor.constraint(equalTo: self.topAnchor)
		])

		self.addSubview(anotherValuteView)
		anotherValuteView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			anotherValuteView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			anotherValuteView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			anotherValuteView.topAnchor.constraint(equalTo: self.roubleValuteView.bottomAnchor, constant: Metrics.bigSizeSeparator.rawValue)
		])
	}

	func setAnotherValute(with anotherValute: AnotherValute) {
		roubleValuteView.countryLabel.text = "Российский рубль"
		roubleValuteView.flagImage.image = UIImage(named: "RUR")
		roubleValuteView.valueTextField.text = String(format: "%.2f", anotherValute.value)

		anotherValuteView.countryLabel.text = anotherValute.country
		anotherValuteView.flagImage.image = UIImage(named: anotherValute.imageName)
		anotherValuteView.valueTextField.text = String(format: "%.2f", anotherValute.nominal)
	}
}
