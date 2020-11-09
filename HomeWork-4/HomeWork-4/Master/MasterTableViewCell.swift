//
//  MasterTableViewCell.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 08.11.2020.
//

import UIKit

final class MasterTableViewCell: UITableViewCell {

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
		self.articleHeaderLabel.numberOfLines = 2
		self.articleHeaderLabel.text = article.title
		self.articleHeaderLabel.textAlignment = .left
		self.articleHeaderLabel.font = Font.headerStyle.font

		self.articleTextLabel.numberOfLines = 2
		self.articleTextLabel.text = article.preText
		self.articleTextLabel.textAlignment = .left
		self.articleTextLabel.font = Font.textStyle.font

		self.articleTimeLabel.text = article.time
		self.articleTimeLabel.textAlignment = .right
		self.articleTimeLabel.font = Font.dateStyle.font

		setupViewsLayout()
	}

	func setupViewsLayout() {
		// Header
		self.addSubview(self.articleHeaderLabel)
		self.articleHeaderLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.articleHeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
															 constant: Metrics.standartSizeSeparatop.rawValue),
			self.articleHeaderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
															  constant: -Metrics.standartSizeSeparatop.rawValue),
			self.articleHeaderLabel.topAnchor.constraint(equalTo: self.topAnchor,
														 constant: Metrics.standartSizeSeparatop.rawValue),
		])

		// Text
		self.addSubview(articleTextLabel)
		self.articleTextLabel.translatesAutoresizingMaskIntoConstraints = false
		self.articleTextLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

		NSLayoutConstraint.activate([
			self.articleTextLabel.topAnchor.constraint(equalTo: self.articleHeaderLabel.bottomAnchor,
													   constant: Metrics.standartSizeSeparatop.rawValue),
			self.articleTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
														  constant: -Metrics.standartSizeSeparatop.rawValue),
			self.articleTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
														   constant: Metrics.standartSizeSeparatop.rawValue)
		])

		// Time
		self.addSubview(self.articleTimeLabel)
		self.articleTimeLabel.translatesAutoresizingMaskIntoConstraints = false
		self.articleTimeLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

		NSLayoutConstraint.activate([
			self.articleTimeLabel.bottomAnchor.constraint(equalTo: self.articleTextLabel.bottomAnchor),
			self.articleTimeLabel.leadingAnchor.constraint(equalTo: self.articleTextLabel.trailingAnchor, constant: 30),
			self.articleTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
		])
	}
}
