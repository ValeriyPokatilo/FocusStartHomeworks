//
//  SceneDelegate.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 07.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		self.window = UIWindow(frame: UIScreen.main.bounds)

		let masterController = MasterViewController()
		let navigationMaster = UINavigationController(rootViewController: masterController)

		let detailController = DetailViewController()
		let navigationDetail = UINavigationController(rootViewController: detailController)

		let splitController = UISplitViewController()
		splitController.viewControllers = [navigationMaster, navigationDetail]
		splitController.preferredDisplayMode = .oneBesideSecondary

		splitController.delegate = self

		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		window?.rootViewController = splitController
		window?.makeKeyAndVisible()
	}
}

extension SceneDelegate {
	@available(iOS 14.0, *)
	func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
		return .primary
	}
}
