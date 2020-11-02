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

	private enum Constants: CGFloat {
		case horizontalStandartSpace = 32
		case verticalStandartSpace = 50
	}

	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)

		loginTextField.delegate = self
		passwordTextField.delegate = self

		setupViews()
		setupViewsLayout()

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
		motionEnterButton(toUp: true)
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

		loginTextField.placeholder = "Login"
		loginTextField.font = .apple18Bold()
		loginTextField.borderStyle = .roundedRect
		loginTextField.returnKeyType = .next

		passwordTextField.placeholder = "Password"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.font = .apple18Bold()
		passwordTextField.borderStyle = .roundedRect
		passwordTextField.returnKeyType = .done

		enterButton.setTitle("Enter", for: .normal)
		enterButton.titleLabel?.font = .apple18Bold()
		enterButton.titleLabel?.textColor = UIColor.white
		enterButton.backgroundColor = UIColor.systemBlue
	}

	func setupViewsLayout() {
		self.addSubview(loginTextField)
		loginTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			loginTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
												constant: Constants.verticalStandartSpace.rawValue),
			loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
													constant: Constants.horizontalStandartSpace.rawValue),
			loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
													 constant: -Constants.horizontalStandartSpace.rawValue)
		])

		self.addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,
												   constant: Constants.horizontalStandartSpace.rawValue),
			passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
													   constant: Constants.horizontalStandartSpace.rawValue),
			passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
														constant: -Constants.horizontalStandartSpace.rawValue)
		])

		self.addSubview(enterButton)
		enterButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			enterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			enterButton.widthAnchor.constraint(equalToConstant: 100)
		])

		enterButtonAtTheBottom = enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
																	 constant: -Constants.verticalStandartSpace.rawValue)
		enterButtonAtTheBottom?.isActive = true

		enterButtonAtTheTop = enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
																  constant: Constants.verticalStandartSpace.rawValue)
	}
}

// MARK: - UITextFieldDelegate

extension ThirdScreenView: UITextFieldDelegate {
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		motionEnterButton(toUp: false)
		self.endEditing(true)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case loginTextField:
			textField.resignFirstResponder()
			passwordTextField.becomeFirstResponder()
		case passwordTextField:
			motionEnterButton(toUp: false)
			self.endEditing(true)
		default:
			break
		}
		return true
	}
}
