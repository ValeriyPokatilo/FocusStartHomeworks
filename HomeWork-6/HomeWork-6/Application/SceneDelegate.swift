//
//  SceneDelegate.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		let mainViewController = ViewController()
		let navigationMainViewController = UINavigationController(rootViewController: mainViewController)
		window?.rootViewController = navigationMainViewController
		window?.makeKeyAndVisible()
	}
}

