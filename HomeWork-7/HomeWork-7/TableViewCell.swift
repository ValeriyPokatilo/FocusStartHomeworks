//
//  TableViewCell.swift
//  HomeWork-7
//
//  Created by Valeriy Pokatilo on 03.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
	let activityIndicator = UIActivityIndicatorView()
	let loadedImage = UIImageView()

	func initialize(imageUrl: String) {
		setupImage()
		setupActivityIndicator()
		getImage(imageUrl: imageUrl)
	}
}

private extension TableViewCell {
	func setupImage() {
		//self.loadedImage.image = UIImage(named: "001")
		self.loadedImage.contentMode = UIView.ContentMode.scaleToFill

		self.addSubview(self.loadedImage)
		self.loadedImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.loadedImage.topAnchor.constraint(
				equalTo: self.topAnchor,
				constant: Metrics.minimumSizeSeparator),
			self.loadedImage.bottomAnchor.constraint(
				equalTo: self.bottomAnchor,
				constant: Metrics.minimumSizeSeparator),
			self.loadedImage.leadingAnchor.constraint(
				equalTo: self.leadingAnchor,
				constant: Metrics.minimumSizeSeparator),
			self.loadedImage.trailingAnchor.constraint(
				equalTo: self.trailingAnchor,
				constant: -Metrics.minimumSizeSeparator)
		])
	}

	func setupActivityIndicator() {
		self.addSubview(self.activityIndicator)
		self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])
		self.activityIndicator.startAnimating()
		self.activityIndicator.hidesWhenStopped = true
	}

	func getImage(imageUrl: String) {
		guard let url = URL(string: imageUrl) else { return }
		let session = URLSession.shared

		session.dataTask(with: url) { (data, responce, error) in
			if let data = data, let image = UIImage(data: data) {
				DispatchQueue.main.async {
					self.loadedImage.image = image
					self.activityIndicator.stopAnimating()
				}
			}
		}.resume()
	}
}
