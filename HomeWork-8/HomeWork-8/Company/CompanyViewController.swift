//
//  CompanyViewController.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit

final class CompanyViewController: UIViewController {
	var companys = [Company]()
	let tableView = UITableView()
	private let cellID = "Cell"

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
}

// MARK: - Setup views

private extension CompanyViewController {
	func setupUI() {
		self.companys = CoreDataManager.shared.fetchCompanys()
		self.setupViews()
		self.setupNavigationBar()
	}

	func setupViews() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: cellID)

		self.setupViewsLayout()
	}

	func setupViewsLayout() {
		self.view.addSubview(self.tableView)
		self.tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			self.tableView.bottomAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
			self.tableView.leadingAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			self.tableView.trailingAnchor.constraint(
				equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
		])
	}

	func setupNavigationBar() {
		self.navigationController?.navigationBar.barTintColor = UIColor.red
		self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ]

		self.title = "Company"

		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
															style: .plain,
															target: self,
															action: #selector(addNewCompany))
		self.navigationController?.navigationBar.tintColor = .white
	}

	@objc func addNewCompany() {
		self.showAlert(title: "New company", message: "Enter company name!")
	}


}

// MARK: - UITableViewDataSource

extension CompanyViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return companys.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID,
													  for: indexPath) as? CompanyTableViewCell

		guard let nonOptionalCell = cell else { return UITableViewCell() }
		nonOptionalCell.configure(company: companys[indexPath.row].brand ?? "")

		return nonOptionalCell
	}
}

// MARK: - UITableViewDelegate

extension CompanyViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		let personVC = PersonViewController()
		personVC.company = self.companys[indexPath.row]
		navigationController?.pushViewController(personVC, animated: true)
	}
}

// MARK: - Alert

extension CompanyViewController {
	private func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let save = UIAlertAction(title: "Save", style: .default) { _ in
			let newCompany: Company?

			guard let newValue = alert.textFields?.first?.text else { return }
			guard !newValue.isEmpty else { return }

			newCompany = CoreDataManager.shared.addCompany(newValue)

			guard let nonOptNewCompany = newCompany else { return }
			self.companys.append(nonOptNewCompany)
			self.tableView.insertRows(at: [IndexPath(row: self.companys.count - 1, section: 0)], with: .automatic)
		}

		let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
			if let indexPath = self.tableView.indexPathForSelectedRow {
				self.tableView.deselectRow(at: indexPath, animated: true)
			}
		}

		alert.addTextField()
		alert.addAction(save)
		alert.addAction(cancel)

		present(alert, animated: true)
	}
}

