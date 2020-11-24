//
//  ConverterViewController.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import UIKit

protocol ConverterViewProtocol: AnyObject {
	func setAnotherValute(with anoverValute: AnotherValute)
}

class ConverterViewController: UIViewController {

	// MARK: - Properties

	private var roubleValuteView = CountryView()
	private var anotherValuteView = CountryView()

	var presenter: ConverterPresenterProtocol!

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.showDetails()
		setupViews()

		roubleValuteView.valueTextField.addTarget(self,
												  action: #selector(changeRoubleValue),
												  for: .editingChanged)
		anotherValuteView.valueTextField.addTarget(self,
												   action: #selector(changeAnotherValue),
												   for: .editingChanged)
    }

	// MARK: - Actions

	@objc func changeRoubleValue() {
		if let newValue = roubleValuteView.valueTextField.text {
			presenter.roubleValueChanged(newValue: newValue)
		}
	}

	@objc func changeAnotherValue() {
		if let newValue = anotherValuteView.valueTextField.text {
			presenter.anotheValueChanged(newValue: newValue)
		}
	}
}

extension ConverterViewController: ConverterViewProtocol {
	func setAnotherValute(with anotherValute: AnotherValute) {
		roubleValuteView.countryLabel.text = "Российский рубль"
		roubleValuteView.flagImage.image = UIImage(named: "RUR")
		roubleValuteView.valueTextField.text = String(format: "%.2f", anotherValute.value)

		anotherValuteView.countryLabel.text = anotherValute.country
		anotherValuteView.flagImage.image = UIImage(named: anotherValute.imageName)
		anotherValuteView.valueTextField.text = String(format: "%.2f", anotherValute.nominal)
	}
}

// MARK: - Setup views

extension ConverterViewController {
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
			anotherValuteView.topAnchor.constraint(equalTo: self.roubleValuteView.bottomAnchor, constant: Metrics.bigSizeSeparator.rawValue)
		])
	}
}
