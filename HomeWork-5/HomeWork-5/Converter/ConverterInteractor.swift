//
//  ConverterInteractor.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import Foundation

protocol ConverterInteractorProtocol: AnyObject {
	func provideConverter()
}

protocol ConverterInteractorOutputProtocol: AnyObject {
	func receiveConverter(anotherValute: AnotherValute)
}

class ConverterInteractor {
	weak var presenter: ConverterInteractorOutputProtocol!
	private var valute: Valute

	init(presenter: ConverterInteractorOutputProtocol, valute: Valute) {
		self.presenter = presenter
		self.valute = valute
	}
}

extension ConverterInteractor: ConverterInteractorProtocol {
	func provideConverter() {
		let anotherValute = AnotherValute(country: valute.Name ?? "",
										  imageName: valute.CharCode ?? "",
										  nominal: String(valute.Nominal ?? 0),
										  value: String(valute.Value ?? 0))
		presenter.receiveConverter(anotherValute: anotherValute)
	}

	
}
