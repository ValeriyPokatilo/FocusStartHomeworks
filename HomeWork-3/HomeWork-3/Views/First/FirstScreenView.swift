//
//  FirstScreenView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 02.11.2020.
//

import UIKit

final class FirstScreenView: UIView {
	
	// MARK: - Properties

	private let smallFontLabel = UILabel()
	private let middleFontLabel = UILabel()
	private let bigFontLabel = UILabel()

	private let circleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
	private let rectangleButton = UIButton()

	private let image = UIImageView()

	private let activityIndicator = UIActivityIndicatorView()

	// MARK: - Lifecycle

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

private extension FirstScreenView {
	func setupViews() {
		self.backgroundColor = .systemBackground

		self.setupLabels()
		self.setupButtons()
		self.setupImage()
		self.setupActivityIndicator()
	}
	
	func setupLabels() {
		self.smallFontLabel.text = "Small label"
		self.smallFontLabel.textAlignment = .center
		self.smallFontLabel.font = Font.apple10.font

		self.middleFontLabel.text = "Medium label"
		self.middleFontLabel.textAlignment = .center
		self.middleFontLabel.font = Font.apple14.font

		self.bigFontLabel.text = "Big label line 1\n Big label line 2"
		self.bigFontLabel.textAlignment = .center
		self.bigFontLabel.font = Font.apple18Bold.font
		self.bigFontLabel.numberOfLines = 2
	}

	func setupButtons() {
		self.circleButton.backgroundColor = .lightGray
		self.circleButton.setTitle("Circle", for: .normal)
		self.circleButton.titleLabel?.font = Font.apple14.font
		self.circleButton.setTitleColor(.white, for: .normal)

		self.rectangleButton.backgroundColor = .lightGray
		self.rectangleButton.setTitle("Rectangle", for: .normal)
		self.rectangleButton.titleLabel?.font = Font.apple14.font
		self.rectangleButton.setTitleColor(.white, for: .normal)
	}

	func setupImage() {
		self.image.contentMode = .scaleAspectFit
		self.image.image = AssetsImage.loremIpsum.image
	}

	func setupActivityIndicator() {
		self.activityIndicator.color = .black
		self.activityIndicator.startAnimating()
	}
}

// MARK: - Setup views layout

private extension FirstScreenView {
	func setupViewsLayout() {
		// Labels
		let labelsView = LabelsView(smallFontLabel: smallFontLabel, middleFontLabel: middleFontLabel, bigFontLabel: bigFontLabel)
		self.addSubview(labelsView)
		labelsView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			labelsView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			labelsView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
											constant: Metrics.smallVerticalSpace.rawValue)
		])

		// Buttons
		let buttonsView = ButtonsView(circleButton: circleButton, rectangleButton: rectangleButton)
		self.addSubview(buttonsView)
		buttonsView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			buttonsView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			buttonsView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])

		// Image
		self.addSubview(image)
		self.image.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.image.widthAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue),
			self.image.heightAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue),
			self.image.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
										  constant: -Metrics.smallVerticalSpace.rawValue),
		])

		// Activity indicator
		self.image.addSubview(activityIndicator)
		self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.activityIndicator.centerXAnchor.constraint(equalTo: image.centerXAnchor),
			self.activityIndicator.centerYAnchor.constraint(equalTo: image.centerYAnchor)
		])
	}
}
