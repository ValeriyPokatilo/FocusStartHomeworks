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
	let nominal: Double
	let value: Double
}

protocol ConverterPresenterProtocol: AnyObject {
	func showDetails()
	func roubleValueChanged(newValue: String)
	func anotheValueChanged(newValue: String)
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
		interactor?.provideConverter()
	}

	func roubleValueChanged(newValue: String) {
		interactor?.provideRoubleConvertation(newValue: newValue)
	}

	func anotheValueChanged(newValue: String) {
		interactor?.provideAnotherConvertation(newValue: newValue)
	}
}

extension ConverterPresenter: PresenterOutputProtocol {
	func receiveConverter(anotherValute: AnotherValute) {
		view?.setAnotherValute(with: anotherValute)
	}
}
