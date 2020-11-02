//
//  FirstScreenView.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 02.11.2020.
//

import UIKit

final class FirstScreenView: UIView {
	
	// MARK: - Properties

	private let label1 = UILabel()
	private let label2 = UILabel()
	private let label3 = UILabel()

	let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
	let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))

	private let image = UIImageView()

	private let activityIndicator = UIActivityIndicatorView()

	private enum Constants: CGFloat {
		case smallVerticalSpace = 8
		case imageSize = 100
	}

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
		label1.text = "Small label"
		label1.textAlignment = .center
		label1.font = .apple10()

		label2.text = "Medium label"
		label2.textAlignment = .center
		label2.font = .apple14()

		label3.text = "Big label line 1\n Big label line 2"
		label3.textAlignment = .center
		label3.font = .apple18Bold()
		label3.numberOfLines = 2
	}

	func setupButtons() {
		button1.backgroundColor = .lightGray
		button1.setTitle("Circle", for: .normal)
		button1.titleLabel?.font = .apple14()
		button1.setTitleColor(.white, for: .normal)
		
		button2.backgroundColor = .lightGray
		button2.setTitle("Rectangle", for: .normal)
		button2.titleLabel?.font = .apple14()
		button2.setTitleColor(.white, for: .normal)
	}

	func setupImage() {
		image.contentMode = .scaleAspectFit
		image.image = Images.loremIpsum.image
	}

	func setupActivityIndicator() {
		activityIndicator.color = .black
		activityIndicator.startAnimating()
	}
}

// MARK: - Setup views layout

extension FirstScreenView {
	func setupViewsLayout() {
		setupViewsLayoutLabels()
		setupViewsLayoutButtons()
		setupViewsLayoutImage()
		setupViewsLayoutActivityIndicator()
	}

	func setupViewsLayoutLabels() {
		let labelsView = LabelsView(label1: label1, label2: label2, label3: label3)
		self.addSubview(labelsView)
		labelsView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			labelsView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			labelsView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
											constant: Constants.smallVerticalSpace.rawValue)
		])
	}

	func setupViewsLayoutButtons() {
		let buttonsView = ButtonsView(button1: button1, button2: button2)
		self.addSubview(buttonsView)
		buttonsView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			buttonsView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			buttonsView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])
	}

	func setupViewsLayoutImage() {
		self.addSubview(image)
		image.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			image.widthAnchor.constraint(equalToConstant: Constants.imageSize.rawValue),
			image.heightAnchor.constraint(equalToConstant: Constants.imageSize.rawValue),
			image.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
										  constant: -Constants.smallVerticalSpace.rawValue),
		])
	}

	func setupViewsLayoutActivityIndicator() {
		image.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: image.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: image.centerYAnchor)
		])
	}
}
