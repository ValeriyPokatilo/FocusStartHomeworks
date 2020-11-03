//
//  SecondScreenView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 31.10.2020.
//
import UIKit

final class SecondScreenView: UIView {

	// MARK: - Properties
	private let scrollView = UIScrollView()
	private let imageView = UIImageView()
	private let headerLabel = UILabel()
	private let textLabel = UILabel()

	private var isLayoutCompact = true

	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

	private enum Constants: CGFloat {
		case horizontalStandardSpace = 16
		case horizontalBigSpace = 32
		case verticalStandartSpace = 10
		case imageSize = 90
	}

	// MARK: - Life Cycle
	public override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupViewsLayout()
		changeViewsLayout(traitCollection: traitCollection)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Change screen method
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)

		changeViewsLayout(traitCollection: traitCollection)
	}
}

// MARK: - Setup views
private extension SecondScreenView {
	func setupViews() {
		self.backgroundColor = .systemBackground

		imageView.image = Images.loremIpsum.image
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true

		headerLabel.text = "Lorem ipsum"
		headerLabel.textAlignment = .center
		headerLabel.font = .apple18Bold()

		textLabel.numberOfLines = 0
		textLabel.text = Text.text
		textLabel.textAlignment = .justified
		textLabel.font = .apple14()
	}
}

// MARK: - Switch screen process
private extension SecondScreenView {
	func changeViewsLayout(traitCollection: UITraitCollection) {
		switch(traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.compact, .regular):
			isLayoutCompact = true
			NSLayoutConstraint.deactivate(regularConstraints)
			NSLayoutConstraint.activate(compactConstraints)
		default:
			guard isLayoutCompact != false else { return }

			isLayoutCompact = false
			NSLayoutConstraint.deactivate(compactConstraints)
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	func setupViewsLayout() {
		createSharedConstraintsArray()
		createCompactConstraintsArray()
		createRegularConstraintsArray()
	}
}

// MARK: - Shared Layout
private extension SecondScreenView {
	func createSharedConstraintsArray() {
		let safeArea = self.safeAreaLayoutGuide

		// ScrollView
		self.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
			scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor)
		])

		// Image
		scrollView.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false


		// Header
		scrollView.addSubview(headerLabel)
		headerLabel.translatesAutoresizingMaskIntoConstraints = false

		// Text
		scrollView.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate(sharedConstraints)
	}
}

// MARK: - Compact Layout
private extension SecondScreenView {
	func createCompactConstraintsArray() {
		let safeArea = self.safeAreaLayoutGuide

		// Image
		compactConstraints.append(contentsOf: [
			imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			imageView.heightAnchor.constraint(equalTo: scrollView.widthAnchor)
		])

		// Header
		compactConstraints.append(contentsOf: [
			headerLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
												 constant: Constants.horizontalStandardSpace.rawValue),
			headerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
												  constant: -Constants.horizontalStandardSpace.rawValue),
			headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
											 constant: Constants.verticalStandartSpace.rawValue)
		])

		// Text
		compactConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,
										   constant: Constants.verticalStandartSpace.rawValue),
			textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
			textLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
		])
	}
}

// MARK: - Regular Layout
private extension SecondScreenView {
	func createRegularConstraintsArray() {
		let safeArea = self.safeAreaLayoutGuide

		// Image
		regularConstraints.append(contentsOf: [
			imageView.topAnchor.constraint(equalTo: scrollView.topAnchor,
										   constant: Constants.horizontalStandardSpace.rawValue),
			imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,
											   constant: Constants.horizontalStandardSpace.rawValue),
			imageView.heightAnchor.constraint(equalToConstant: 75),
			imageView.widthAnchor.constraint(equalToConstant: 75)
		])

		// Header
		regularConstraints.append(contentsOf: [
			headerLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,
												 constant: Constants.horizontalStandardSpace.rawValue),
			headerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
												  constant: -Constants.horizontalStandardSpace.rawValue),
			headerLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
		])

		// Text
		regularConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
										   constant: Constants.verticalStandartSpace.rawValue),
			textLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
											   constant: Constants.horizontalStandardSpace.rawValue),
			textLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
												constant: -Constants.horizontalStandardSpace.rawValue),
			textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
		])
	}
}
