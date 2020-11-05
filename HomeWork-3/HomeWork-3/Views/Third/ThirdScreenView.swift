//
//  ThirdScreenView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 02.11.2020.
//

import UIKit

final class ThirdScreenView: UIView {

	// MARK: - Properties

	let loginTextField = UITextField()
	let passwordTextField = UITextField()
	let enterButton = UIButton()

	var enterButtonAtTheTop: NSLayoutConstraint?
	var enterButtonAtTheBottom: NSLayoutConstraint?

	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)

		self.loginTextField.delegate = self
		self.passwordTextField.delegate = self

		self.setupViews()
		self.setupViewsLayout()

		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillAppear),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - Moution Enter button

private extension ThirdScreenView {
	@objc func keyboardWillAppear() {
		self.motionEnterButton(toUp: true)
	}

	func motionEnterButton(toUp: Bool) {
		if toUp {
			guard let bottomPlace = enterButtonAtTheBottom?.isActive else { return }
			if bottomPlace {
				animateConstraint()
			}
		} else {
			guard let topPlace = enterButtonAtTheTop?.isActive else { return }
			if topPlace {
				animateConstraint()
			}
		}
	}

	func animateConstraint() {
		self.enterButtonAtTheBottom?.isActive.toggle()
		self.enterButtonAtTheTop?.isActive.toggle()
		UIView.animate(withDuration: 1) {
			self.enterButton.layoutIfNeeded()
		}
	}
}

// MARK: - Setup views

private extension ThirdScreenView {
	func setupViews() {
		self.backgroundColor = .systemBackground

		self.loginTextField.placeholder = "Login"
		self.loginTextField.font = Font.apple18Bold.font
		self.loginTextField.borderStyle = .roundedRect
		self.loginTextField.returnKeyType = .next

		self.passwordTextField.placeholder = "Password"
		self.passwordTextField.isSecureTextEntry = true
		self.passwordTextField.font = Font.apple18Bold.font
		self.passwordTextField.borderStyle = .roundedRect
		self.passwordTextField.returnKeyType = .done

		self.enterButton.setTitle("Enter", for: .normal)
		self.enterButton.titleLabel?.font = Font.apple18Bold.font
		self.enterButton.titleLabel?.textColor = UIColor.white
		self.enterButton.backgroundColor = UIColor.systemBlue
	}

	func setupViewsLayout() {
		self.addSubview(loginTextField)
		loginTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.loginTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
												constant: Metrics.verticalStandartSpace.rawValue),
			self.loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
													constant: Metrics.horizontalStandartSpace.rawValue),
			self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
													 constant: -Metrics.horizontalStandartSpace.rawValue)
		])

		self.addSubview(passwordTextField)
		self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,
												   constant: Metrics.horizontalStandartSpace.rawValue),
			self.passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
													   constant: Metrics.horizontalStandartSpace.rawValue),
			self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
														constant: -Metrics.horizontalStandartSpace.rawValue)
		])

		self.addSubview(enterButton)
		self.enterButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.enterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.enterButton.widthAnchor.constraint(equalToConstant: 100)
		])

		self.enterButtonAtTheBottom = enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
																	 constant: -Metrics.verticalStandartSpace.rawValue)
		self.enterButtonAtTheBottom?.isActive = true

		self.enterButtonAtTheTop = enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
																  constant: Metrics.verticalStandartSpace.rawValue)
	}
}

// MARK: - UITextFieldDelegate

extension ThirdScreenView: UITextFieldDelegate {
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		self.motionEnterButton(toUp: false)
		self.endEditing(true)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case loginTextField:
			textField.resignFirstResponder()
			self.passwordTextField.becomeFirstResponder()
		case passwordTextField:
			self.motionEnterButton(toUp: false)
			self.endEditing(true)
		default:
			break
		}
		return true
	}
}
