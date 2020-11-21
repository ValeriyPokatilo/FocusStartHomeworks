//
//  CurrencyRouter.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import Foundation

protocol CurrencyRouterProtocol: AnyObject {
	func openCurrencyConverterController(with valute: Valute)
}

class CurrencyRouter {
	weak var viewController: CurrencyViewController!

	init(viewController: CurrencyViewController) {
		self.viewController = viewController
	}
}

extension CurrencyRouter: CurrencyRouterProtocol {
	func openCurrencyConverterController(with valute: Valute) {
		let converter = ConverterViewController()
		let configurator: ConverterConfiguratorProtocol = ConverterConfigurator()
		configurator.configure(with: converter, and: valute)

		self.viewController.navigationController?.pushViewController(converter, animated: true)
	}
}