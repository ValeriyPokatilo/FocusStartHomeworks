//
//  DetailViewController.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 07.11.2020.
//

import UIKit

final class DetailViewController: UIViewController {

	// MARK: - Properties

	var article: Article?

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavigation()
	}

	override func loadView() {
		guard let currenArticle = article else { return }
		self.view = DescriptionTextView(article: currenArticle)
	}
}

extension DetailViewController {
	func setupNavigation() {
		guard let currenArticle = article else { return }
		self.navigationItem.title = currenArticle.title
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}
