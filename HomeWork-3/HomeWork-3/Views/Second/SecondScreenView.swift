//
//  SecondScreenView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 31.10.2020.
//

import UIKit

final class SecondScreenView: UIView {

	// MARK: Properties

	private let scrollView = UIScrollView()
	private let imageView = UIImageView()
	private let headerLabel = UILabel()
	private let textLabel = UILabel()

	private var isLayoutCompact = true

	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

//	private enum Constants: CGFloat {
//		case imageViewHeight = 300
//		case horizontalStandardSpace = 16
//		case horizontalBigSpace = 32
//	}

	// MARK: Life Cycle

	public override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews() 
		setupViewsLayout()
		changeViewsLayout(traitCollection: traitCollection)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Changes Cycle

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)

		// Обработка поворота экрана
		changeViewsLayout(traitCollection: traitCollection)
	}
}

// MARK: Appearances - Настройка вьюх

private extension SecondScreenView {
	func setupViews() {
		self.backgroundColor = .systemBackground

		imageView.image = Images.loremIpsum.image
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true

		headerLabel.text = "Заголовок"
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
		print(safeArea)

		// ScrollView
		self.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
			scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor)
		])

		// ImageView
		scrollView.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false


		// Header
		scrollView.addSubview(headerLabel)
		headerLabel.translatesAutoresizingMaskIntoConstraints = false

		// Text
		scrollView.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate(sharedConstraints) // ?????????????????????????????
	}
}

// MARK: Compact Layout - Портретный режим

private extension SecondScreenView {

	func createCompactConstraintsArray() {
		let safeArea = self.safeAreaLayoutGuide
		print(safeArea)

		compactConstraints.append(contentsOf: [
			imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			imageView.heightAnchor.constraint(equalTo: scrollView.widthAnchor)
		])

		compactConstraints.append(contentsOf: [
			headerLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
			headerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
			headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10)
		])


		compactConstraints.append(contentsOf: [
			textLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
			textLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
			textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
			textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
		])
	}
}

// MARK: Regular Layout - Горизонтальный режим

private extension SecondScreenView {
	func createRegularConstraintsArray() {
		let safeArea = self.safeAreaLayoutGuide
		print(safeArea)

		regularConstraints.append(contentsOf: [
			imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
			imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
			imageView.heightAnchor.constraint(equalToConstant: 75),
			imageView.widthAnchor.constraint(equalToConstant: 75)
		])

		//let center = scrollView.frame.size.width - CGFloat(200 + 32)
		regularConstraints.append(contentsOf: [
			headerLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			headerLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16)
		])

		regularConstraints.append(contentsOf: [
			textLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32),
			textLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32),
			textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
			textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
		])
	}
}
