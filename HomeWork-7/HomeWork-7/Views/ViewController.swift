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
		self.textField.clearButtonMode = UITextField.ViewMode.whileEditing

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


}

// MARK: - Network

private extension ViewController {
	@objc func getImage() {
		let imageUrl = textField.text ?? ""

		guard let url = URL(string: imageUrl) else {
			self.showAlert(title: "Error", message: "Invalid URL address")
			return
		}

		let session = URLSession.shared

		session.dataTask(with: url) { (data, responce, error) in
			if error != nil {
				self.showAlert(title: "Error", message: error?.localizedDescription ?? "")
			}

			if let data = data, let image = UIImage(data: data) {
				DispatchQueue.main.async {
					self.images.append(image)

					let newIndexPath = IndexPath(row: self.images.count - 1, section: 0)
					self.tableView.insertRows(at: [newIndexPath], with: .fade)
				}
			}
		}.resume()
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
		nonOptionalCell.initialize(image: images[indexPath.row])

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

// MARK: - Alert

private extension ViewController {
	func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
		let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
		alert.addAction(ok)
		self.present(alert, animated: true)
	}
}
