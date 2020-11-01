//
//  MainTabBarController.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 29.10.2020.
//

import UIKit

final class MainTabBarController: UITabBarController {

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

		self.setupUI()
    }
}

// MARK: - Private functions

private extension MainTabBarController {
	func setupUI() {
		tabBar.tintColor = .systemBlue

		let boldConf = UIImage.SymbolConfiguration(weight: .medium)
		let tabIcon1 = UIImage(systemName: "battery.100", withConfiguration: boldConf)!
		let tabIcon2 = UIImage(systemName: "battery.25", withConfiguration: boldConf)!
		let tabIcon3 = UIImage(systemName: "battery.0", withConfiguration: boldConf)!

		viewControllers = [
			addNavigationController(rootViewController: SecondViewController(), title: "Second screen", image: tabIcon2),
			addNavigationController(rootViewController: ThirdViewController(), title: "Third screen", image: tabIcon3),
			addNavigationController(rootViewController: FirstViewController(), title: "First screen", image: tabIcon1),
		]

	}

	func addNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
		let navigationVC = UINavigationController(rootViewController: rootViewController)
		navigationVC.tabBarItem.title = title
		navigationVC.tabBarItem.image = image

		return navigationVC
	}
}
