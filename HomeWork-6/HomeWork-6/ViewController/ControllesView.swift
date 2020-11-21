//
//  ControllesView.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class ControllesView: UIView {
	var pingButton = UIButton()
	private var connectionStackView = UIStackView()
	var connectionSwitcher = UISwitch()
	private var connectionLabel = UILabel()

	init() {
		super.init(frame: .zero)
		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ControllesView {
	func setupView() {
		// View
		self.backgroundColor = UIColor.systemBackground

		// Button
		let button = ButtonBuilder()
		let buttonDirector = ButtonDirector(buttonBuilder: button)
		self.pingButton = buttonDirector.createButton()

		// StackView
		let stackView = StackViewBuilder()
		let stackViewDirector = StackViewDirector(stackViewBuilder: stackView)
		self.connectionStackView = stackViewDirector.createStackView()

		// Switch
		let switcher = SwithBuilder()
		let switchDirector = SwitchDirector(switchFieldBuilder: switcher)
		self.connectionSwitcher = switchDirector.createSwitch()

		// Label
		let label = LabelBuilder()
		let labelDirector = LabelDirector(labelBuilder: label)
		self.connectionLabel = labelDirector.createLabel()

		setupViewLayout()
	}

	func setupViewLayout() {
		// Button
		self.addSubview(pingButton)
		self.pingButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.pingButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
			self.pingButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			self.pingButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			self.pingButton.heightAnchor.constraint(equalToConstant: 24)
		])

		// StackView
		self.addSubview(self.connectionStackView)
		self.connectionStackView.translatesAutoresizingMaskIntoConstraints = false
		self.connectionStackView.addArrangedSubview(connectionSwitcher)
		self.connectionStackView.addArrangedSubview(connectionLabel)

		NSLayoutConstraint.activate([
			self.connectionStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			self.connectionStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			self.connectionStackView.topAnchor.constraint(equalTo: self.pingButton.bottomAnchor, constant: 40),
		])

		self.bottomAnchor.constraint(equalTo: self.connectionStackView.bottomAnchor).isActive = true
	}

}
