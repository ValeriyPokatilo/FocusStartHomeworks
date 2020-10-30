//
//  FirstViewController.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 29.10.2020.
//

import UIKit

final class FirstViewController: UIViewController {

	// MARK: - Properties

	let label1 = UILabel()
	let label2 = UILabel()
	let label3 = UILabel()

	let button1 = UIButton()
	let button2 = UIButton()

	let image = UIImageView()

	let activityIndicator = UIActivityIndicatorView()

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = .green

		setupUI()
    }
}

// MARK: - Extension for private function

private extension FirstViewController {
	func setupUI() {

		let labelsView = setupLabels()
		labelsView.translatesAutoresizingMaskIntoConstraints = false

		let buttonsView = setupButtons()
		buttonsView.translatesAutoresizingMaskIntoConstraints = false

		setupImage()

		self.view.addSubview(labelsView)
		self.view.addSubview(buttonsView)
		self.view.addSubview(image)

		NSLayoutConstraint.activate([
			labelsView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
			labelsView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
		])

		NSLayoutConstraint.activate([
			buttonsView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			buttonsView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			image.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
			image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
		])
	}

	func setupLabels() -> UIView {
		label1.text = "Small label"
		label1.textAlignment = .center
		label1.font = .american10()

		label2.text = "Medium label"
		label2.textAlignment = .center
		label2.font = .avenir14()

		label3.text = "Big label"
		label3.textAlignment = .center
		label3.font = .apple18()
		label3.numberOfLines = 2

		return FirstScreenLabelsView(label1: label1, label2: label2, label3: label3)
	}

	func setupButtons() -> UIView {
		button1.backgroundColor = .purple
		button1.setTitle("Circle", for: .normal)
		button1.titleLabel?.font = .avenir14()
		button1.titleLabel?.textColor = .white
		button1.setTitleColor(.red, for: .normal)

		button2.backgroundColor = .blue
		button2.setTitle("Rectangle", for: .normal)
		button2.titleLabel?.font = .avenir14()
		button2.titleLabel?.textColor = .white
		button2.setTitleColor(.red, for: .normal)

		return FirstScreenButtonsView(button1: button1, button2: button2)
	}

	func setupImage() {
		image.contentMode = .scaleAspectFit
		image.image = #imageLiteral(resourceName: "loremIpsum_square")

		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.color = .green
		activityIndicator.startAnimating()
		image.addSubview(activityIndicator)

		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: image.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: image.centerYAnchor)
		])

		image.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			image.heightAnchor.constraint(equalToConstant: 100),
			image.widthAnchor.constraint(equalToConstant: 100)
		])
	}

}
