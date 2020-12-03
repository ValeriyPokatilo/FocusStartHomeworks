//
//  ViewController.swift
//  HomeWork-7
//
//  Created by Valeriy Pokatilo on 03.12.2020.
//

import UIKit

class ViewController: UIViewController {
	var images: [UIImage] = []
	let textField = UITextField()
	let tableView = UITableView(frame: .zero, style: .insetGrouped)
	let getButton = UIButton()
	let controllerStackView = UIStackView()
	private let cellID = "Cell"

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}
}

// MARK: - Setup views

private extension ViewController {
	func setupViews() {
		self.view.backgroundColor = Colors.backgroundColor

		self.controllerStackView.axis = NSLayoutConstraint.Axis.horizontal
		self.controllerStackView.spacing = Metrics.stackViewSpacing

		self.textField.placeholder = "Insert link to image"
		self.textField.textAlignment = NSTextAlignment.left
		self.textField.borderStyle = UITextField.BorderStyle.roundedRect

		self.getButton.backgroundColor = Colors.getButtonColor
		self.getButton.tintColor = .white
		self.getButton.setImage(UIImage(systemName: "play.rectangle"), for: UIControl.State.normal)
		self.getButton.layer.cornerRadius = 4
		self.getButton.addTarget(self, action: #selector(getImage), for: UIControl.Event.touchUpInside)

		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
		self.tableView.backgroundColor = Colors.backgroundColor

		self.setupViewsLayout()
	}

	func setupViewsLayout() {
		self.view.addSubview(self.controllerStackView)
		self.controllerStackView.translatesAutoresizingMaskIntoConstraints = false

		self.controllerStackView.addArrangedSubview(self.textField)
		self.controllerStackView.addArrangedSubview(self.getButton)

		NSLayoutConstraint.activate([
			self.controllerStackView.topAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.topAnchor,
				constant: Metrics.bigSizeSeparator),
			self.controllerStackView.leadingAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
				constant: Metrics.standartSizeSeparator),
			self.controllerStackView.trailingAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
				constant: -Metrics.standartSizeSeparator)
		])

		self.getButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.getButton.widthAnchor.constraint(
				equalToConstant: Metrics.buttonWidth)
		])

		self.view.addSubview(self.tableView)
		self.tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(
				equalTo: self.textField.bottomAnchor,
				constant: Metrics.standartSizeSeparator),
			self.tableView.bottomAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
			self.tableView.leadingAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			self.tableView.trailingAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
		])
	}

	@objc func getImage() {
		let newIndexPath = IndexPath(row: images.count, section: 0)
		images.append(UIImage())
		tableView.insertRows(at: [newIndexPath], with: .fade)
	}
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return images.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID,
												 for: indexPath) as? TableViewCell

		guard let nonOptionalCell = cell else { return UITableViewCell() }
		nonOptionalCell.initialize(imageUrl: self.textField.text ?? "")

		return nonOptionalCell
	}
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Metrics.tableViewHeight
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
	}
}
