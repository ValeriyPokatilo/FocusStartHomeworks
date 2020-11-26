//
//  CurrencyInteractor.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import Foundation

protocol CurrencyInteractorProtocol: AnyObject {
	func fetchCurrensys()
}

protocol CurrencyInteractorOutputProtocol: AnyObject {
	func currencysDidReceive(_ valutes: [Valute])
}

final class CurrencyInteractor {
	weak var presenter: CurrencyInteractorOutputProtocol? = CurrencyPresenter(view: CurrencyViewController())

	required init(presenter: CurrencyInteractorOutputProtocol) {
		self.presenter = presenter
	}
}

extension CurrencyInteractor: CurrencyInteractorProtocol {
	func fetchCurrensys() {
		NetworkManager.shared.getExchangeRate { [weak self] valutes in
			self?.presenter?.currencysDidReceive(valutes)
		}
	}
}
