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
						  preText: "",
						  text: "Выберите модель",
						  time: nil,
						  topImage: AssetsImage.iphone0front.image,
						  bottomImage: AssetsImage.iphone0rear.image)

	private let scrollView = UIScrollView()

	private let articleText = UILabel()
	private let topPicture = UIImageView()
	private let bottomPicture = UIImageView()

	private let topRoundedShadowImageView = RoundShadowImageView()
	private let bottomRoundedShadowImageView = RoundShadowImageView()

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
			self.articleText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
													  constant: Metrics.standartSizeSeparatop.rawValue),
			self.articleText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,
													   constant: -Metrics.standartSizeSeparatop.rawValue),
			self.articleText.topAnchor.constraint(equalTo: scrollView.topAnchor,
												  constant: Metrics.standartSizeSeparatop.rawValue),
		])


		self.scrollView.addSubview(topRoundedShadowImageView)
		self.topRoundedShadowImageView.image = topPicture.image
		self.topRoundedShadowImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.topRoundedShadowImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
			self.topRoundedShadowImageView.topAnchor.constraint(equalTo: articleText.bottomAnchor,
																constant: Metrics.standartSizeSeparatop.rawValue),
			self.topRoundedShadowImageView.heightAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue),
			self.topRoundedShadowImageView.widthAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue)
		])


		self.scrollView.addSubview(bottomRoundedShadowImageView)
		self.bottomRoundedShadowImageView.image = bottomPicture.image
		self.bottomRoundedShadowImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.bottomRoundedShadowImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
			self.bottomRoundedShadowImageView.topAnchor.constraint(equalTo: topRoundedShadowImageView.bottomAnchor,
																   constant: Metrics.bigSizeSeparatop.rawValue),
			self.bottomRoundedShadowImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,
																	  constant: Metrics.standartSizeSeparatop.rawValue),
			self.bottomRoundedShadowImageView.heightAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue),
			self.bottomRoundedShadowImageView.widthAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue)
		])
	}
}
