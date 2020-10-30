//
//  SecondViewController.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 29.10.2020.
//

import UIKit

final class SecondViewController: UIViewController {

	// MARK: - Properties

	let scrollView = UIScrollView()
	let headerLabel = UILabel()
	let imageView = UIImageView()
	let textView = UITextView()

	let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."


	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()



		self.view.backgroundColor = .red

		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		self.scrollView.frame = self.view.bounds
	}
}

// MARK: - Extension for private function

private extension SecondViewController {
	func setupUI() {

		let viewForScroll = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 1545))
		scrollView.delegate = self
		scrollView.contentSize = CGSize(width: viewForScroll.frame.width, height: viewForScroll.frame.height)

		viewForScroll.backgroundColor =  UIColor.yellow

		imageView.contentMode = .scaleAspectFit
		imageView.image = #imageLiteral(resourceName: "loremIpsum_square")
		imageView.translatesAutoresizingMaskIntoConstraints = false

		viewForScroll.addSubview(imageView)

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: viewForScroll.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: viewForScroll.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: viewForScroll.trailingAnchor),
			imageView.widthAnchor.constraint(equalTo: viewForScroll.widthAnchor),
			imageView.heightAnchor.constraint(equalTo: viewForScroll.widthAnchor)
		])

		headerLabel.text = "Заголовок"
		headerLabel.textAlignment = .center
		headerLabel.font = .apple18()
		headerLabel.translatesAutoresizingMaskIntoConstraints = false

		viewForScroll.addSubview(headerLabel)

		NSLayoutConstraint.activate([
			headerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
			headerLabel.leadingAnchor.constraint(equalTo: viewForScroll.leadingAnchor),
			headerLabel.trailingAnchor.constraint(equalTo: viewForScroll.trailingAnchor)
		])


		textView.text = text + " " + text + " " + text
		textView.textAlignment = .justified
		textView.font = .avenir14()
		textView.textColor = .black
		textView.backgroundColor = .red
		textView.translatesAutoresizingMaskIntoConstraints = false

		viewForScroll.addSubview(textView)

		NSLayoutConstraint.activate([
			textView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
			textView.leadingAnchor.constraint(equalTo: viewForScroll.leadingAnchor, constant: 20),
			textView.trailingAnchor.constraint(equalTo: viewForScroll.trailingAnchor, constant: -20),
			textView.bottomAnchor.constraint(equalTo: viewForScroll.bottomAnchor, constant: -20)
		])

		self.scrollView.addSubview(viewForScroll)
		view.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])


	}
}

extension SecondViewController: UIScrollViewDelegate {

}

extension SecondViewController {
}
