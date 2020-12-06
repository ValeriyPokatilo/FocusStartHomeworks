//
//  PersonViewController.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit


final class PersonViewController: UIViewController {
	var company: Company?
	var persons = [Person]()
	let tableView = UITableView()
	private let cellID = "Cell"

	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupUI()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.persons = CoreDataManager.shared.fetchPersons(company: company!)
		self.tableView.reloadData()
	}
}

// MARK: - Setup views

private extension PersonViewController {
	func setupUI() {
		self.setupViews()
		self.setupNavigationBar()
	}

	func setupViews() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: cellID)

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

		self.title = String(company?.brand ?? "")

		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
															style: .plain,
															target: self,
															action: #selector(addNewPerson))
		self.navigationController?.navigationBar.tintColor = .white
	}

	@objc func addNewPerson() {
		self.goToDetails()
	}

	func goToDetails(person: Person? = nil) {
		let personDetailsVC = PersonDetailsViewController()

		if let person = person {
			personDetailsVC.person = person
		}
		if let company = company {
			personDetailsVC.company = company
		}
		navigationController?.pushViewController(personDetailsVC, animated: true)
	}
}

// MARK: - UITableViewDataSource

extension PersonViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return persons.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID,
													  for: indexPath) as? PersonTableViewCell

		guard let nonOptionalCell = cell else { return UITableViewCell() }
		nonOptionalCell.configure(persons[indexPath.row])

		return nonOptionalCell
	}
}

// MARK: - UITableViewDelegate

extension PersonViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		self.goToDetails(person: self.persons[indexPath.row])
	}
}
