//
//  CurrencyPresenter.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import Foundation

protocol CurrencyPresenterProtocol: AnyObject {
	var valutes: [Valute] { get }
	var valutesCount: Int? { get }

	func viewDidLoad()
	func valute(atIndex indexPath: IndexPath) -> Valute?
	func showValuteDetail(for indexPath: IndexPath)
}

final class CurrencyPresenter {
	weak var view: CurrencyViewProtocol!
	var interactor: CurrencyInteractorProtocol!
	var router: CurrencyRouterProtocol!

	var valutes: [Valute] = []
	var valutesCount: Int? {
		valutes.count
	}

	required init(view: CurrencyViewProtocol) {
		self.view = view
	}
}

// MARK: - CurrencyPresenterProtocol

extension CurrencyPresenter: CurrencyPresenterProtocol {
	func viewDidLoad() {
		self.interactor.fetchCurrensys()
	}

	func valute(atIndex indexPath: IndexPath) -> Valute? {
		guard self.valutes.indices.contains(indexPath.row) else { return nil } 
		return valutes[indexPath.row]

	}

	func showValuteDetail(for indexPath: IndexPath) {
		if valutes.indices.contains(indexPath.row) {
			let valute = valutes[indexPath.row]
			router.openCurrencyConverterController(with: valute)
		}
	}
}

extension CurrencyPresenter: CurrencyInteractorOutputProtocol {
	func currencysDidReceive(_ valutes: [Valute]) {
		self.valutes = valutes
		view.reloadData()
	}
}
