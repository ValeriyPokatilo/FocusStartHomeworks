//
//  PersonDetailsViewController.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit

final class PersonDetailsViewController: UIViewController {

	// MARK: - Properties

	var person: Person?
	var company: Company?
	let details = DetailsView()

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.systemBackground
		self.setupNavigationBar()
		self.setupPerson()
	}

	override func loadView() {
		self.view = details
	}
}

// MARK: - Navigation

private extension PersonDetailsViewController {
	func setupNavigationBar() {
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
																 style: .plain,
																 target: self,
																 action: #selector(savePerson))
	}

	func setupPerson() {
		if let person = person {
			details.nameTextField.text = person.name
			details.ageTextField.text = String(person.age)
			details.experienceTextField.text = String(person.experience)
			details.educationTextField.text = person.education
			details.positionTextField.text = person.position
		}
	}

	@objc func savePerson() {
		if details.nameTextField.text == "" ||
		details.ageTextField.text == "" ||
		details.positionTextField.text == ""
		{ self.showAlert(title: "Ошибка", message: "Заполните имя, возраст и образование")
		} else {
			guard let company = company else { return }
			guard let nonOptAge = Int(self.details.ageTextField.text ?? "0") else {
				self.showAlert(title: "Ошибка", message: "Неверно введен возраст")
				return
			}
			guard let nonOptexperience = Int(self.details.experienceTextField.text ?? "0") else {
				self.showAlert(title: "Ошибка", message: "Неверно введен стаж работы")
				return
			}

			if person == nil {
				CoreDataManager.shared.addPerson(company: company,
												 name: self.details.nameTextField.text ?? "",
												 age: nonOptAge,
												 experience: nonOptexperience,
												 education: self.details.educationTextField.text ?? "",
												 position: self.details.positionTextField.text ?? "")
			} else {
				guard let person = person else { return }
				guard let nonOptAge = Int(self.details.ageTextField.text ?? "0") else {
					self.showAlert(title: "Ошибка", message: "Неверно введен возраст")
					return
				}
				guard let nonOptexperience = Int(self.details.experienceTextField.text ?? "0") else {
					self.showAlert(title: "Ошибка", message: "Неверно введен стаж работы")
					return
				}
				CoreDataManager.shared.savePerson(person: person,
												  name: self.details.nameTextField.text ?? "",
												  age: nonOptAge,
												  experience: nonOptexperience,
												  education: self.details.educationTextField.text ?? "",
												  position: self.details.positionTextField.text ?? "")
			}

			self.navigationController?.popViewController(animated: true)
		}

	}

	func addTargets() {
		self.details.nameTextField.addTarget(self, action: #selector(textFieldCheck), for: .editingDidBegin)
		self.details.ageTextField.addTarget(self, action: #selector(textFieldCheck), for: .editingDidBegin)
		self.details.experienceTextField.addTarget(self, action: #selector(textFieldCheck), for: .editingDidBegin)
		self.details.educationTextField.addTarget(self, action: #selector(textFieldCheck), for: .editingDidBegin)
		self.details.positionTextField.addTarget(self, action: #selector(textFieldCheck), for: .editingDidBegin)
	}

	@objc func textFieldCheck() {
		if self.details.nameTextField.text == "" &&
			self.details.ageTextField.text == "" &&
			self.details.experienceTextField.text == ""  {
			self.navigationItem.rightBarButtonItem?.isEnabled = false
		} else {
			self.navigationItem.rightBarButtonItem?.isEnabled = true
		}
	}
}

// MARK: - Alert

extension PersonDetailsViewController {
	private func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let ok = UIAlertAction(title: "Ok", style: .default)

		alert.addAction(ok)

		present(alert, animated: true)
	}
}




