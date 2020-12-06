//
//  SceneDelegate.swift
//  HomeWork-7
//
//  Created by Valeriy Pokatilo on 03.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		let viewController = ViewController()
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
	}
}

