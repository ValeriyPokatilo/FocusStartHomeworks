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

	let circleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
	let rectangleButton = UIButton()

	private let image = UIImageView()

	private let activityIndicator = UIActivityIndicatorView()

	// MARK: - Lifecycle

	public override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupViewsLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Setup views

extension FirstScreenView {
	func setupViews() {
		self.backgroundColor = .systemBackground

		setupLabels()
		setupButtons()
		setupImage()
		setupActivityIndicator()
	}
	
	func setupLabels() {
		smallFontLabel.text = "Small label"
		smallFontLabel.textAlignment = .center
		smallFontLabel.font = Font.apple10.font

		middleFontLabel.text = "Medium label"
		middleFontLabel.textAlignment = .center
		middleFontLabel.font = Font.apple14.font

		bigFontLabel.text = "Big label line 1\n Big label line 2"
		bigFontLabel.textAlignment = .center
		bigFontLabel.font = Font.apple18Bold.font
		bigFontLabel.numberOfLines = 2
	}

	func setupButtons() {
		circleButton.backgroundColor = .lightGray
		circleButton.setTitle("Circle", for: .normal)
		circleButton.titleLabel?.font = Font.apple14.font
		circleButton.setTitleColor(.white, for: .normal)
		
		rectangleButton.backgroundColor = .lightGray
		rectangleButton.setTitle("Rectangle", for: .normal)
		rectangleButton.titleLabel?.font = Font.apple14.font
		rectangleButton.setTitleColor(.white, for: .normal)
	}

	func setupImage() {
		image.contentMode = .scaleAspectFit
		image.image = AssetsImage.loremIpsum.image
	}

	func setupActivityIndicator() {
		activityIndicator.color = .black
		activityIndicator.startAnimating()
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
		image.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			image.widthAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue),
			image.heightAnchor.constraint(equalToConstant: Metrics.imageSize.rawValue),
			image.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
										  constant: -Metrics.smallVerticalSpace.rawValue),
		])

		// Activity indicator
		image.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: image.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: image.centerYAnchor)
		])
	}
}
