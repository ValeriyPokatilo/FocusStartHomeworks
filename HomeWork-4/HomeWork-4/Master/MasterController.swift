//
//  MasterController.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 07.11.2020.
//

import UIKit

class MasterController: UIViewController {

	// MARK: - Properties

	let cellID = "Cell"
	var tableView = UITableView()

	// MARK: - LifeCycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()
	}
}

// MARK: - Setup views

extension MasterController {
	func setupUI() {

		tableView.delegate = self
		tableView.dataSource = self

		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

		self.view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
		])
	}
}

// MARK: - Table view

extension MasterController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}


	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

		cell.textLabel?.text = "Header"

		return cell
	}
}


