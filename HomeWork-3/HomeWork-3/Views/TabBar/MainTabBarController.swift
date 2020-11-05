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
		setupUI()
    }



}

// MARK: - Setup TabBar UI

private extension MainTabBarController {
	func setupUI() {
		tabBar.tintColor = .systemBlue

		//let boldConf = UIImage.SymbolConfiguration(weight: .medium)
		let tabIcon1 = SystemImage.batteryFull.image
		let tabIcon2 = SystemImage.batteryMiddle.image
		let tabIcon3 = SystemImage.batteryLow.image

		viewControllers = [
			self.addNavigationController(rootViewController: FirstViewController(), title: "First screen", image: tabIcon1),
			self.addNavigationController(rootViewController: SecondViewController(), title: "Second screen", image: tabIcon2),
			self.addNavigationController(rootViewController: ThirdViewController(), title: "Third screen", image: tabIcon3),
		]
	}

	func addNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
		let navigationVC = UINavigationController(rootViewController: rootViewController)
		navigationVC.tabBarItem.title = title
		navigationVC.tabBarItem.image = image

		return navigationVC
	}
}
