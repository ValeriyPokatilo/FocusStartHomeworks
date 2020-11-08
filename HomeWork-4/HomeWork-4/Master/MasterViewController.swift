//
//  MasterViewController.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 07.11.2020.
//

import UIKit

final class MasterViewController: UITableViewController {

	// Properties

	let artictles = Article.returnArticle()
	let cellID = "Cell"

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView = UITableView(frame: .zero, style: .insetGrouped)

		self.tableView.register(MasterTableViewCell.self, forCellReuseIdentifier: cellID)

		self.tableView.rowHeight = UITableView.automaticDimension

		self.navigationItem.title = "Список моделей"
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}

// MARK: - Table view

extension MasterViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		artictles.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? MasterTableViewCell
		else { return UITableViewCell() }

		cell.cellConfigure(article: artictles[indexPath.row])

		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let controller = DetailViewController()
		controller.article = artictles[indexPath.row]
		let navigationController = UINavigationController(rootViewController: controller)
		self.splitViewController?.showDetailViewController(navigationController, sender: nil)
	}
}
