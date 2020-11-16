//
//  CurrencyViewController.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import UIKit

protocol CurrencyViewProtocol: AnyObject {
	func reloadData()
}

final class CurrencyViewController: UIViewController {

	// MARK: - Properties

	let cellID = "Cell"
	var tableView = UITableView()

	var presenter: CurrencyPresenterProtocol!
	private let configurator: CurrencyConfiguratorProtocol = CurrencyConfigurator()
	//var selfToDetailsSegueName = "showDetail"

	// MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
		self.configurator.configure(view: self)
		self.presenter.viewDidLoad()
		self.setupNavigationBar()
		self.setupTableView()
    }
}

// MARK: - CurrencyViewProtocol

extension CurrencyViewController: CurrencyViewProtocol {
	func reloadData() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

// MARK: - Setup table view

private extension CurrencyViewController {
	func setupNavigationBar() {
		if #available(iOS 13.0, *) {
			self.navigationItem.title = "Курсы валют"

			let navBarAppearance = UINavigationBarAppearance()
			navBarAppearance.configureWithOpaqueBackground()
			//navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
			//navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
			navBarAppearance.backgroundColor = UIColor.white
			navigationController?.navigationBar.standardAppearance = navBarAppearance
			navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
		}
	}

	func setupTableView() {
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(CurrencyCell.self, forCellReuseIdentifier: cellID)

		setupTableViewLayout()
	}

	func setupTableViewLayout() {
		self.view.addSubview(tableView)
		self.tableView.translatesAutoresizingMaskIntoConstraints = false

		let safeArea = self.view.safeAreaLayoutGuide

		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
		])
	}
}

// MARK: - UITableViewDataSource

extension CurrencyViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.valutesCount ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID,
												 for: indexPath) as! CurrencyCell

		guard let valute = presenter.valute(atIndex: indexPath) else {
			return UITableViewCell()
		}

		cell.cellConfigure(valute: valute)

		return cell
	}
}

// MARK: - UITableViewDelegate

extension CurrencyViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		presenter.showValuteDetail(for: indexPath)


	}
}
