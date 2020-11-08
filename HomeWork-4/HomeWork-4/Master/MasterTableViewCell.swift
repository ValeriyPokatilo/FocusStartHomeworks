//
//  MasterTableViewCell.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 08.11.2020.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

	// MARK: - Properties

	let articleHeaderLabel = UILabel()
	let articleTextLabel = UILabel()
	let articleTimeLabel = UILabel()

	// MARK: - Lifecycle

	func cellConfigure(article: Article) {
		setupViews(article: article)
	}
}

// MARK: - Setup views

private extension MasterTableViewCell {
	func setupViews(article: Article) {
		self.articleHeaderLabel.numberOfLines = 0
		self.articleHeaderLabel.text = article.title
		self.articleHeaderLabel.textAlignment = .left
		self.articleHeaderLabel.font = Font.headerStyle.font

		self.articleTextLabel.numberOfLines = 0
		self.articleTextLabel.text = "\(article.text.prefix(70))... -> TAP HERE"
		self.articleTextLabel.textAlignment = .left
		self.articleTextLabel.font = Font.textStyle.font

		self.articleTimeLabel.text = article.time
		self.articleTimeLabel.textAlignment = .right
		self.articleTimeLabel.font = Font.dateStyle.font

		setupViewsLayout()
	}

	func setupViewsLayout() {
		self.addSubview(self.articleHeaderLabel)
		self.articleHeaderLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.articleHeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
														constant: 16),
			self.articleHeaderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
														constant: -16),
			self.articleHeaderLabel.topAnchor.constraint(equalTo: self.topAnchor,
														constant: 16),
		])

		self.addSubview(self.articleTextLabel)
		self.articleTextLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.articleTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
														constant: 16),
			self.articleTextLabel.widthAnchor.constraint(equalToConstant: 250),
			self.articleTextLabel.topAnchor.constraint(equalTo: articleHeaderLabel.bottomAnchor,
													   constant: 8),
			self.articleTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
													   constant: -8),
		])

		self.addSubview(self.articleTimeLabel)
		self.articleTimeLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.articleTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
															constant: -16),
			self.articleTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
														  constant: -8),
			self.articleTimeLabel.widthAnchor.constraint(equalToConstant: 70)
		])
	}
}
