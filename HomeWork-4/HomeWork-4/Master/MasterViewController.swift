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

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()

		// Если запускае мна iPad то показываем содержимое первой ячейки
		if UIDevice.current.userInterfaceIdiom == .pad {
			didSelectRowAt(index: 0)
		}
	}
}

// MARK: - Table view setup

private extension MasterViewController {
	func setupTableView() {
		self.tableView = UITableView(frame: .zero, style: .insetGrouped)

		self.tableView.register(MasterTableViewCell.self, forCellReuseIdentifier: cellID)

		self.tableView.rowHeight = UITableView.automaticDimension

		self.navigationItem.title = "Список моделей"
		self.navigationController?.navigationBar.prefersLargeTitles = true	}
}

// MARK: - Table view DataSource

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
}

// MARK: - Table view Delegate

extension MasterViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		didSelectRowAt(index: indexPath.row)
	}
}

private extension MasterViewController {
	func didSelectRowAt(index: Int) {
		let controller = DetailViewController()
		controller.article = artictles[index]
		let navigationController = UINavigationController(rootViewController: controller)
		self.splitViewController?.showDetailViewController(navigationController, sender: nil)
	}
}
