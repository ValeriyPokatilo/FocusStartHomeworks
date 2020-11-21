//
//  CustomView.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class CustomView: UIView {
	var logTextView = UITextView()
	var controllersView = ControllesView()

	init() {
		super.init(frame: .zero)
		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

private extension CustomView {
	func setupView() {
		// View
		self.backgroundColor = UIColor.systemBackground

		// TextView
		let textView = TextViewBuilder()
		let textViewDirector = TextViewDirector(textViewBuilder: textView)
		self.logTextView = textViewDirector.createTextView()

		setupViewLayout()
	}

	func setupViewLayout() {


		// TextView
		self.addSubview(logTextView)
		logTextView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.logTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			self.logTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			self.logTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
			//self.logTextView.bottomAnchor.constraint(equalTo: self.controllersView.topAnchor, constant: -20),
		])

		self.addSubview(self.controllersView)
		self.controllersView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.controllersView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			self.controllersView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
			self.controllersView.topAnchor.constraint(equalTo: self.logTextView.bottomAnchor, constant: 20),
			self.controllersView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
		])
	}

}
