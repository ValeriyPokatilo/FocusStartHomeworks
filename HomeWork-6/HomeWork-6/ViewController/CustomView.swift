//
//  CustomView.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

final class CustomView: UIView, TextViewProtocol {
	var logTextView = UITextView() // Private ?
	var controllersView = ControllesView() // Private ?

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
			self.logTextView.leadingAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.leadingAnchor,
				constant: Metrics.horizontalOffset.rawValue),
			self.logTextView.trailingAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.trailingAnchor,
				constant: -Metrics.horizontalOffset.rawValue),
			self.logTextView.topAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.topAnchor,
				constant: Metrics.verticalOffset.rawValue),
		])

		self.addSubview(self.controllersView)
		self.controllersView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.controllersView.leadingAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.leadingAnchor,
				constant: Metrics.horizontalOffset.rawValue),
			self.controllersView.trailingAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.trailingAnchor,
				constant: -Metrics.horizontalOffset.rawValue),
			self.controllersView.topAnchor.constraint(
				equalTo: self.logTextView.bottomAnchor,
				constant: Metrics.verticalOffset.rawValue),
			self.controllersView.bottomAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.bottomAnchor,
				constant: -Metrics.verticalOffset.rawValue),
		])
	}
}
