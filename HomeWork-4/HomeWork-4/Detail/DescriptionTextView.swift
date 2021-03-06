//
//  DescriptionView.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 17.11.2020.
//

import UIKit

final class DescriptionTextView: UIView {

	// MARK: - Properties

	private var article: Article?

	private let scrollView = UIScrollView()

	private let articleText = UILabel()
	private let topPicture = UIImageView()
	private let bottomPicture = UIImageView()

	private let topRoundedShadowImageView = RoundShadowImageView()
	private let bottomRoundedShadowImageView = RoundShadowImageView()

	// MARK: - Lifecycle

	init(article: Article) {
		super.init(frame: .zero)
		self.article = article

		self.setupViews()
		self.setupViewsLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Setup views

private extension DescriptionTextView {
	func setupViews() {
		backgroundColor = .systemBackground

		guard let currenArticle = article else { return }

		// Article
		self.articleText.numberOfLines = 0
		self.articleText.text = currenArticle.text
		self.articleText.textAlignment = .justified
		self.articleText.font = Font.textStyle.font

		// Pictures
		self.topPicture.contentMode = .scaleAspectFit
		self.topPicture.image = currenArticle.topImage

		self.bottomPicture.contentMode = .scaleAspectFit
		self.bottomPicture.image = currenArticle.bottomImage
	}

	func setupViewsLayout() {
		// ScrollView
		self.addSubview(scrollView)
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.scrollView.centerXAnchor.constraint(equalTo:  safeAreaLayoutGuide.centerXAnchor),
			self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
			self.scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor)
		])

		// Text
		self.scrollView.addSubview(articleText)
		self.articleText.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.articleText.leadingAnchor.constraint(
				equalTo: self.leadingAnchor,
				constant: Metrics.standartSizeSeparatop.rawValue),
			self.articleText.trailingAnchor.constraint(
				equalTo: self.trailingAnchor,
				constant: -Metrics.standartSizeSeparatop.rawValue),
			self.articleText.topAnchor.constraint(
				equalTo: scrollView.topAnchor,
				constant: Metrics.standartSizeSeparatop.rawValue),
		])


		// Top pictures
		self.scrollView.addSubview(topRoundedShadowImageView)
		self.topRoundedShadowImageView.image = topPicture.image
		self.topRoundedShadowImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.topRoundedShadowImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.topRoundedShadowImageView.topAnchor.constraint(
				equalTo: articleText.bottomAnchor,
				constant: Metrics.bigSizeSeparatop.rawValue),
			self.topRoundedShadowImageView.heightAnchor.constraint(
				equalToConstant: Metrics.imageSize.rawValue),
			self.topRoundedShadowImageView.widthAnchor.constraint(
				equalToConstant: Metrics.imageSize.rawValue)
		])

		// Bottom pictures
		self.scrollView.addSubview(bottomRoundedShadowImageView)
		self.bottomRoundedShadowImageView.image = bottomPicture.image
		self.bottomRoundedShadowImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.bottomRoundedShadowImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.bottomRoundedShadowImageView.topAnchor.constraint(
				equalTo: topRoundedShadowImageView.bottomAnchor,
				constant: Metrics.bigSizeSeparatop.rawValue),
			self.bottomRoundedShadowImageView.bottomAnchor.constraint(
				equalTo: scrollView.bottomAnchor,
				constant: -Metrics.standartSizeSeparatop.rawValue),
			self.bottomRoundedShadowImageView.heightAnchor.constraint(
				equalToConstant: Metrics.imageSize.rawValue),
			self.bottomRoundedShadowImageView.widthAnchor.constraint(
				equalToConstant: Metrics.imageSize.rawValue)
		])
	}
}
