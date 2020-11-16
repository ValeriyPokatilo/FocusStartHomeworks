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

	var roubleValuteView = CountryView()
	var anotherValuteView = CountryView()

	var presenter: ConverterPresenterProtocol!

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.showDetails()
		setupViews()

		roubleValuteView.valueTextField.addTarget(self, action: #selector(changeRoubleValue), for: .editingChanged)
		anotherValuteView.valueTextField.addTarget(self, action: #selector(changeAnotherValue), for: .editingChanged)
    }

	// MARK: - Actions

	@objc func changeRoubleValue() {
		print("r")
	}

	@objc func changeAnotherValue() {
		print("a")
	}

}

extension ConverterViewController: ConverterViewProtocol {
	func setAnotherValute(with anoverValute: AnotherValute) {
		roubleValuteView.valueTextField.text = anoverValute.value

		anotherValuteView.countryLabel.text = anoverValute.country
		anotherValuteView.flagImage.image = UIImage(named: anoverValute.imageName)
		anotherValuteView.valueTextField.text = anoverValute.nominal
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
			anotherValuteView.topAnchor.constraint(equalTo: self.roubleValuteView.bottomAnchor, constant: 32)
		])
	}
}
