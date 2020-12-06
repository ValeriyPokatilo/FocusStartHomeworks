//
//  SceneDelegate.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		let mainViewController = CompanyViewController()
		let navigationMainViewController = UINavigationController(rootViewController: mainViewController)
		window?.rootViewController = navigationMainViewController
		window?.makeKeyAndVisible()
	}
}

