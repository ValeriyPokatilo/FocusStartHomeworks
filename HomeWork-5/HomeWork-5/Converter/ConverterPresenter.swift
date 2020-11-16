//
//  ConverterPresenter.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import Foundation

struct AnotherValute {
	let country: String
	let imageName: String
	let nominal: String
	let value: String
}

protocol ConverterPresenterProtocol: AnyObject {
	func showDetails()
}

class ConverterPresenter {
	weak var view: ConverterViewProtocol!
	var interactor: ConverterInteractorProtocol!

	required init(view: ConverterViewProtocol) {
		self.view = view
	}
}

extension ConverterPresenter: ConverterPresenterProtocol {
	func showDetails() {
		interactor.provideConverter()
	}
}

extension ConverterPresenter: ConverterInteractorOutputProtocol {
	func receiveConverter(anotherValute: AnotherValute) {
		view.setAnotherValute(with: anotherValute)
	}
}
