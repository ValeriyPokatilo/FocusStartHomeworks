//
//  TableViewCell.swift
//  HomeWork-7
//
//  Created by Valeriy Pokatilo on 03.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
	let loadedImage = UIImageView()

	func initialize(image: UIImage) {
		setupImage(image: image)
	}
}

private extension TableViewCell {
	func setupImage(image: UIImage) {
		self.loadedImage.contentMode = UIView.ContentMode.scaleToFill
		self.loadedImage.image = image

		self.addSubview(self.loadedImage)
		self.loadedImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.loadedImage.topAnchor.constraint(
				equalTo: self.topAnchor),
			self.loadedImage.bottomAnchor.constraint(
				equalTo: self.bottomAnchor),
			self.loadedImage.leadingAnchor.constraint(
				equalTo: self.leadingAnchor),
			self.loadedImage.trailingAnchor.constraint(
				equalTo: self.trailingAnchor)
		])
	}
}


