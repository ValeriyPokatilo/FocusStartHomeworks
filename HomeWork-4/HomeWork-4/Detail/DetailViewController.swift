//
//  DetailViewController.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 07.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

	// MARK: - Properties

	var article = Article(title: "Энциклопедия iPhone",
						  text: "Выберите модель",
						  time: nil,
						  topImage: AssetsImage.iphone0front.image,
						  bottomImage: AssetsImage.iphone0rear.image)

	private let scrollView = UIScrollView()

	private let articleText = UILabel()
	private let topPicture = UIImageView()
	private let bottomPicture = UIImageView()

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupNavigation()
		setupViews()
		setupViewsLayout()
	}
}

// MARK: - Setup navigation

extension DetailViewController {
	func setupNavigation() {
		self.navigationItem.title = self.article.title
		self.navigationController?.navigationBar.prefersLargeTitles = true

		if let splitController = self.splitViewController {
			if let navigationController = splitController.viewControllers.last as? UINavigationController {
				navigationController.topViewController?.navigationItem.leftBarButtonItem = splitController.displayModeButtonItem
			}
		}
	}
}

// MARK: - Setup views

private extension DetailViewController {
	func setupViews() {
		self.view.backgroundColor = .systemBackground

		self.articleText.numberOfLines = 0
		self.articleText.text = article.text
		self.articleText.textAlignment = .justified
		self.articleText.font = Font.textStyle.font

		self.topPicture.contentMode = .scaleAspectFit
		self.topPicture.image = article.topImage

		self.bottomPicture.contentMode = .scaleAspectFit
		self.bottomPicture.image = article.bottomImage

	}

	func setupViewsLayout() {
		self.view.addSubview(scrollView)
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.scrollView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
			self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
			self.scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
		])


		self.scrollView.addSubview(articleText)
		self.articleText.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.articleText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			self.articleText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			self.articleText.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
		])

		self.scrollView.addSubview(topPicture)
		self.topPicture.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.topPicture.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
			self.topPicture.topAnchor.constraint(equalTo: articleText.bottomAnchor, constant: 16),
			self.topPicture.heightAnchor.constraint(equalToConstant: 300),
			self.topPicture.widthAnchor.constraint(equalToConstant: 300)
		])


		self.scrollView.addSubview(bottomPicture)
		self.bottomPicture.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.bottomPicture.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
			self.bottomPicture.topAnchor.constraint(equalTo: topPicture.bottomAnchor, constant: 16),
			self.bottomPicture.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
			self.bottomPicture.heightAnchor.constraint(equalToConstant: 300),
			self.bottomPicture.widthAnchor.constraint(equalToConstant: 300)
		])
	}
}
