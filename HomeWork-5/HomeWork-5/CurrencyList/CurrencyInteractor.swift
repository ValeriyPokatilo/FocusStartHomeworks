//
//  CurrencyInteractor.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import Foundation

protocol CurrencyInteractorProtocol: AnyObject {
	func extractTitle()
	func fetchCurrensys()
}

protocol CurrencyInteractorOutputProtocol: AnyObject {
	func currencysDidReceive(_ valutes: [Valute])
}

final class CurrencyInteractor {
	weak var presenter: CurrencyInteractorOutputProtocol!

	required init(presenter: CurrencyInteractorOutputProtocol) {
		self.presenter = presenter
	}
}

extension CurrencyInteractor: CurrencyInteractorProtocol {
	func extractTitle() {
		// Get title from userDef
	}

	func fetchCurrensys() {
		NetworkManager.shared.getExchangeRate { [weak self] valutes in
			self?.presenter.currencysDidReceive(valutes)
		}
	}
}
