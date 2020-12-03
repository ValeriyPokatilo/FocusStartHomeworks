//
//  ConverterViewController.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import UIKit

final class ConverterViewController: UIViewController {

	// MARK: - Properties

	private var firstValuteView = CountryView()
	private var secondValuteView = CountryView()
	private var numberPadView = NumberPadView()
	private var exchangeStringLabel = UILabel()

	var viewModel: ConverterViewModelProtocol? {
		didSet {
			self.firstValuteView.countryLabel.text = viewModel?.firstValuteName
			guard let firstImageName = viewModel?.firstValuteCharCode else { return }
			self.firstValuteView.flagImage.image = UIImage(named: firstImageName)
			self.firstValuteView.valueLabel.text = "0"

			self.secondValuteView.countryLabel.text = viewModel?.secondValuteName
			guard let secondImageName = viewModel?.secondValuteCharCode else { return }
			self.secondValuteView.flagImage.image = UIImage(named: secondImageName)
			self.secondValuteView.valueLabel.text = "0"

			self.exchangeStringLabel.text = self.viewModel?.resultString
		}
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.addTargets()
		self.setupViews()
		self.setupViewsLayout()
	}
}

// MARK: - Methods

private extension ConverterViewController {
	func addTargets() {
		self.numberPadView.button1.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button2.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button3.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button4.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button5.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button6.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button7.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button8.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button9.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.button0.addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
		self.numberPadView.buttonClear.addTarget(self, action: #selector(clear), for: UIControl.Event.touchUpInside)
	}

	func valueChanged() {

		if let newValue = self.firstValuteView.valueLabel.text {
			if let newValueDouble = Double(newValue) {
				let oldNominal = Double(viewModel?.nominal ?? 0)
				let oldValue = viewModel?.value ?? 0
				let result = TextFormatter.shared.doubleFormatter(value: oldNominal * newValueDouble / oldValue)
				self.secondValuteView.valueLabel.text = result
			}
		}
	}
}

// MARK: - IB Actions

extension ConverterViewController {
	@objc func buttonPressed(_ sender: UIButton) {
		if self.firstValuteView.valueLabel.text == "0" {
			self.firstValuteView.valueLabel.text = String(sender.tag)
		} else {
			let valueText = self.firstValuteView.valueLabel.text ?? ""
			self.firstValuteView.valueLabel.text = valueText + String(sender.tag)
		}

		self.valueChanged()	}


	@objc func clear() {
		self.firstValuteView.valueLabel.text = "0"
		self.secondValuteView.valueLabel.text = "0"
	}
}

// MARK: - Setup views

extension ConverterViewController {
	func setupViews() {
		self.view.backgroundColor = UIColor.darkGray

		self.exchangeStringLabel.textColor = UIColor.white
		self.exchangeStringLabel.font = Font.dateStyle.font
		self.exchangeStringLabel.textAlignment = .center
	}

	func setupViewsLayout() {
		self.view.addSubview(self.firstValuteView)
		self.firstValuteView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.firstValuteView.topAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.topAnchor,
				constant: Metrics.standartSizeSeparator),
			self.firstValuteView.leadingAnchor.constraint(
				equalTo: self.view.leadingAnchor,
				constant: Metrics.standartSizeSeparator),
			self.firstValuteView.trailingAnchor.constraint(
				equalTo: self.view.trailingAnchor,
				constant: -Metrics.standartSizeSeparator)
		])

		self.view.addSubview(self.secondValuteView)
		self.secondValuteView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.secondValuteView.topAnchor.constraint(
				equalTo: self.firstValuteView.bottomAnchor,
				constant: Metrics.standartSizeSeparator),
			self.secondValuteView.leadingAnchor.constraint(
				equalTo: self.view.leadingAnchor,
				constant: Metrics.standartSizeSeparator),
			self.secondValuteView.trailingAnchor.constraint(
				equalTo: self.view.trailingAnchor,
				constant: -Metrics.standartSizeSeparator)
		])

		self.view.addSubview(self.exchangeStringLabel)
		self.exchangeStringLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.exchangeStringLabel.topAnchor.constraint(
				equalTo: self.secondValuteView.bottomAnchor,
				constant: Metrics.standartSizeSeparator),
			self.exchangeStringLabel.heightAnchor.constraint(
				equalToConstant: Metrics.textHeight),
			self.exchangeStringLabel.leadingAnchor.constraint(
				equalTo: self.view.leadingAnchor,
				constant: Metrics.standartSizeSeparator),
			self.exchangeStringLabel.trailingAnchor.constraint(
				equalTo: self.view.trailingAnchor,
				constant: -Metrics.standartSizeSeparator)
		])

		self.view.addSubview(self.numberPadView)
		self.numberPadView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.numberPadView.topAnchor.constraint(
				equalTo: self.exchangeStringLabel.bottomAnchor,
				constant: Metrics.standartSizeSeparator),
			self.numberPadView.bottomAnchor.constraint(
				equalTo: self.view.bottomAnchor),
			self.numberPadView.leadingAnchor.constraint(
				equalTo: self.view.leadingAnchor),
			self.numberPadView.trailingAnchor.constraint(
				equalTo: self.view.trailingAnchor),
		])
	}
}
