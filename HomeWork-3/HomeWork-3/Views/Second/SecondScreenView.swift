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

		self.imageView.image = AssetsImage.loremIpsum.image
		self.imageView.contentMode = .scaleAspectFill
		self.imageView.clipsToBounds = true

		self.headerLabel.text = "Lorem ipsum"
		self.headerLabel.textAlignment = .center
		self.headerLabel.font = Font.apple18Bold.font

		self.textLabel.numberOfLines = 0
		self.textLabel.text = Text.text
		self.textLabel.textAlignment = .justified
		self.textLabel.font = Font.apple14.font
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
												 constant: Metrics.horizontalStandartSpace.rawValue),
			headerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
												  constant: -Metrics.horizontalStandartSpace.rawValue),
			headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
											 constant: Metrics.verticalStandartSpace.rawValue)
		])

		// Text
		compactConstraints.append(contentsOf: [
			textLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
											   constant: Metrics.horizontalStandartSpace.rawValue),
			textLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
												constant: -Metrics.horizontalStandartSpace.rawValue),
			textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,
										   constant: Metrics.verticalStandartSpace.rawValue),
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
										   constant: Metrics.verticalStandartSpace.rawValue),
			imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,
											   constant: Metrics.verticalStandartSpace.rawValue),
			imageView.heightAnchor.constraint(equalToConstant: 75),
			imageView.widthAnchor.constraint(equalToConstant: 75)
		])

		// Header
		regularConstraints.append(contentsOf: [
			headerLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,
												 constant: Metrics.horizontalStandartSpace.rawValue),
			headerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
												  constant: -Metrics.horizontalStandartSpace.rawValue),
			headerLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
		])

		// Text
		regularConstraints.append(contentsOf: [
			textLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
											   constant: Metrics.horizontalStandartSpace.rawValue),
			textLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
												constant: -Metrics.horizontalStandartSpace.rawValue),
			textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
										   constant: Metrics.verticalStandartSpace.rawValue),
			textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
		])
	}
}
