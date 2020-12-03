//
//  CurrencyCellViewModelProtocol.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 02.12.2020.
//

import Foundation

protocol CurrencyCellViewModelProtocol: AnyObject {
	var charCode: String? { get }
	var name: String? { get }
	var resultString: String { get }
	var toUp: Bool { get }
	init(valute: Valute)
}
