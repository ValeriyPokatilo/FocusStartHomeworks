//
//  DetailsView.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit

final class DetailsView: UIView {

	// MARK: - Properties

	var nameTextField = UITextField()
	var ageTextField = UITextField()
	var experienceTextField = UITextField()
	var educationTextField = UITextField()
	var positionTextField = UITextField()

	var mainStackView = UIStackView()

	// MARK: - Lifecycle

	init() {
		super.init(frame: .zero)
		self.setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension DetailsView {
	func setupView() {
		self.nameTextField.placeholder = "Имя"
		self.nameTextField.borderStyle = UITextField.BorderStyle.roundedRect

		self.ageTextField.placeholder = "Возраст"
		self.ageTextField.borderStyle = UITextField.BorderStyle.roundedRect
		self.ageTextField.keyboardType = UIKeyboardType.numberPad

		self.experienceTextField.placeholder = "Опыт работы"
		self.experienceTextField.borderStyle = UITextField.BorderStyle.roundedRect
		self.experienceTextField.keyboardType = UIKeyboardType.numberPad

		self.educationTextField.placeholder = "Образование"
		self.educationTextField.borderStyle = UITextField.BorderStyle.roundedRect

		self.positionTextField.placeholder = "Должность"
		self.positionTextField.borderStyle = UITextField.BorderStyle.roundedRect

		self.mainStackView.axis = NSLayoutConstraint.Axis.vertical
		self.mainStackView.spacing = Metrics.stackViewSpacing

		self.mainStackView.addArrangedSubview(nameTextField)
		self.mainStackView.addArrangedSubview(ageTextField)
		self.mainStackView.addArrangedSubview(experienceTextField)
		self.mainStackView.addArrangedSubview(educationTextField)
		self.mainStackView.addArrangedSubview(positionTextField)

		self.setupViewLayout()
	}

	func setupViewLayout() {
		self.addSubview(self.mainStackView)
		self.mainStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.mainStackView.topAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.topAnchor,
				constant: Metrics.standartSizeSeparator),
			self.mainStackView.leadingAnchor.constraint(
				equalTo: self.leadingAnchor,
				constant: Metrics.standartSizeSeparator),
			self.mainStackView.trailingAnchor.constraint(
				equalTo: self.trailingAnchor,
				constant: Metrics.standartSizeSeparator)
		])


	}
}
