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

// MARK: - Private functions

private extension ThirdScreenView {
	@objc func keyboardWillAppear() {
		guard let bottomPlace = enterButtonAtTheBottom?.isActive else { return }
		if bottomPlace {
			toggleConstraint()

			UIView.animate(withDuration: 3){
				self.enterButton.layoutIfNeeded()
			}
		}
	}

	func toggleConstraint() {
		self.enterButtonAtTheBottom?.isActive.toggle()
		self.enterButtonAtTheTop?.isActive.toggle()
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
		enterButton.layer.cornerRadius = 5
	}

	func setupViewsLayout() {
		self.addSubview(loginTextField)
		loginTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			loginTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
			loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
		])

		self.addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
			passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
		])

		self.addSubview(enterButton)
		enterButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			enterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			enterButton.widthAnchor.constraint(equalToConstant: 100)
		])

		enterButtonAtTheBottom = enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
																	 constant: -20)
		enterButtonAtTheBottom?.isActive = true

		enterButtonAtTheTop = enterButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
																  constant: 50)
	}
}

// MARK: - UITextFieldDelegate

extension ThirdScreenView: UITextFieldDelegate {
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.endEditing(true)

		guard let topPlace = enterButtonAtTheTop?.isActive else { return }
		if topPlace {
			toggleConstraint()

			UIView.animate(withDuration: 3){
				self.enterButton.layoutIfNeeded()
			}
		}
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		switch textField {
		case loginTextField:
			textField.resignFirstResponder()
			passwordTextField.becomeFirstResponder()
		case passwordTextField:
			self.endEditing(true)
			self.toggleConstraint()
		default:
			break
		}
	}
}
