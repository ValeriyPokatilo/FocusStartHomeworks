//
//  CurrencyConfigurator.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import Foundation

protocol CurrencyConfiguratorProtocol: AnyObject {
	func configure(view viewController: CurrencyViewController)
}

class CurrencyConfigurator: CurrencyConfiguratorProtocol {
	func configure(view viewController: CurrencyViewController) {
		let presenter = CurrencyPresenter(view: viewController)
		let interactor = CurrencyInteractor(presenter: presenter)
		let router = CurrencyRouter(viewController: viewController)

		viewController.presenter = presenter
		presenter.interactor = interactor
		presenter.router = router
	}

}
