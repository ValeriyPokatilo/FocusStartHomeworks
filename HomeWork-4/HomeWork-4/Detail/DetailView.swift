//
//  DetailView.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 08.11.2020.
//

import UIKit

final class DetailView: UIView {

	// Properties

	private let scrollView = UIScrollView()

	private let articleText = UILabel()
	private let topPicture = UIImageView()
	private let bottomPicture = UIImageView()

	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)

		self.setupViews()
		self.setupViewsLayout()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Setup views

private extension DetailView {
	func setupViews() {
		self.backgroundColor = .systemBackground

		self.articleText.numberOfLines = 0
		self.articleText.text = Text.iphone4TopText
		self.articleText.textAlignment = .justified
		self.articleText.font = Font.textStyle.font

		self.topPicture.contentMode = .scaleAspectFit
		self.topPicture.image = AssetsImage.iphone4front.image

		self.bottomPicture.contentMode = .scaleAspectFit
		self.bottomPicture.image = AssetsImage.iphone4rear.image

	}

	func setupViewsLayout() {
		self.addSubview(scrollView)
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.scrollView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
			self.scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor)
		])


		self.scrollView.addSubview(articleText)
		self.articleText.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.articleText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
			self.articleText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
			self.articleText.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
		])

		self.scrollView.addSubview(topPicture)
		self.topPicture.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.topPicture.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.topPicture.topAnchor.constraint(equalTo: articleText.bottomAnchor, constant: 16),
			self.topPicture.heightAnchor.constraint(equalToConstant: 300),
			self.topPicture.widthAnchor.constraint(equalToConstant: 300)
		])


		self.scrollView.addSubview(bottomPicture)
		self.bottomPicture.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.bottomPicture.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.bottomPicture.topAnchor.constraint(equalTo: topPicture.bottomAnchor, constant: 16),
			self.bottomPicture.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
			self.bottomPicture.heightAnchor.constraint(equalToConstant: 300),
			self.bottomPicture.widthAnchor.constraint(equalToConstant: 300)
		])
	}
}

