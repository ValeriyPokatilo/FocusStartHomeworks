//
//  ThirdViewController.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 29.10.2020.
//

import UIKit

final class ThirdViewController: UIViewController {

	// MARK: - Properties

	let loginTextField = UITextField()
	let passwordTextField = UITextField()
	let enterButton = UIButton()

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = UIColor.yellow

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)


		setupUI()
    }

	@objc func keyboardWillAppear() {
		print("key")
	}
}

private extension ThirdViewController {
	func setupUI() {
		loginTextField.placeholder = "Login"
		loginTextField.font = .apple18()
		loginTextField.borderStyle = .roundedRect
		loginTextField.returnKeyType = .next
		loginTextField.translatesAutoresizingMaskIntoConstraints = false

		self.view.addSubview(loginTextField)

		NSLayoutConstraint.activate([
			loginTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
			loginTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			loginTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
			loginTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
		])

		passwordTextField.placeholder = "Password"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.font = .apple18()
		passwordTextField.borderStyle = .roundedRect
		passwordTextField.returnKeyType = .done
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false

		self.view.addSubview(passwordTextField)

		NSLayoutConstraint.activate([
			passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
			passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
			passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
		])

		enterButton.setTitle("Enter", for: .normal)
		enterButton.titleLabel?.font = .apple18()
		enterButton.titleLabel?.textColor = UIColor.white
		enterButton.backgroundColor = UIColor.systemBlue
		enterButton.layer.cornerRadius = 5
		enterButton.translatesAutoresizingMaskIntoConstraints = false

		self.view.addSubview(enterButton)

		NSLayoutConstraint.activate([
			enterButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
			enterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			enterButton.widthAnchor.constraint(equalToConstant: 100)
		])

	}
}

extension ThirdViewController: UITextFieldDelegate {

	func textFieldDidEndEditing(_ textField: UITextField) {
		switch textField {
		case loginTextField:
			textField.resignFirstResponder()
			passwordTextField.becomeFirstResponder()
		case passwordTextField:
			textField.resignFirstResponder()
		default:
			break
		}
	}


	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
}
