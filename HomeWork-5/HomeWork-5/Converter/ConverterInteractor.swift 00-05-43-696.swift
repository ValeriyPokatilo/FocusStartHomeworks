//
//  ConverterInteractor.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 16.11.2020.
//

import Foundation

protocol ConverterInteractorProtocol: AnyObject {
	var presenter: ConverterOutput? { get set }
	func provideConverter()
	func provideRoubleConvertation(newValue: String)
	func provideAnotherConvertation(newValue: String)
}

protocol ConverterOutput: AnyObject {
	func receiveConverter(anotherValute: AnotherValute)
}

class ConverterInteractor {
	var presenter: ConverterOutput?
	private let valute: Valute

	init(valute: Valute) {
		self.valute = valute
	}
}

extension ConverterInteractor: ConverterInteractorProtocol {

	func provideConverter() {
		let anotherValute = AnotherValute(country: valute.Name ?? "",
										  imageName: valute.CharCode ?? "",
										  nominal: Double(valute.Nominal ?? 0),
										  value: valute.Value ?? 0)
		self.presenter?.receiveConverter(anotherValute: anotherValute)
	}

	func provideRoubleConvertation(newValue: String) {
		guard let newValueDouble = Double(newValue) else { return }
		let nominal = Double(valute.Nominal ?? 0) * newValueDouble / (valute.Value ?? 0)

		let anotherValute = AnotherValute(country: valute.Name ?? "",
										  imageName: valute.CharCode ?? "",
										  nominal: nominal,
										  value: newValueDouble)
		self.presenter?.receiveConverter(anotherValute: anotherValute)
	}

	func provideAnotherConvertation(newValue: String) {
		if let newNominal = Double(newValue) {

			let newValue = (newNominal * Double(valute.Value ?? 0)) / Double(valute.Nominal ?? 0)
			let anotherValute = AnotherValute(country: valute.Name ?? "",
											  imageName: valute.CharCode ?? "",
											  nominal: newNominal,
											  value: newValue)
			self.presenter?.receiveConverter(anotherValute: anotherValute)
		}
	}
}
