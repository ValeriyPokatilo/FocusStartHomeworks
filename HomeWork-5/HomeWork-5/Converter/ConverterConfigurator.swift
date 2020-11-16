//
//  ConverterConfigurator.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import Foundation

protocol ConverterConfiguratorProtocol: AnyObject {
	func configure(with view: ConverterViewController, and valute: Valute)
}

class ConverterConfigurator: ConverterConfiguratorProtocol {
	func configure(with view: ConverterViewController, and valute: Valute) {
		let presenter = ConverterPresenter(view: view)
		let interactor = ConverterInteractor(presenter: presenter, valute: valute)

		view.presenter = presenter
		presenter.interactor = interactor
	}
}
