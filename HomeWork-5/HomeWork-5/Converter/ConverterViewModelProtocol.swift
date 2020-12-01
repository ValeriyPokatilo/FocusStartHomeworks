//
//  ConverterViewModelProtocol.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 02.12.2020.
//

import Foundation

protocol ConverterViewModelProtocol: AnyObject {
	var firstValuteName: String? { get }
	var firstValuteCharCode: String? { get }
	var firstValuteValue: String? { get }

	var secondValuteName: String? { get }
	var secondValuteCharCode: String? { get }
	var secondValuteValue: String? { get }

	var nominal: Int? { get }
	var value: Double? { get }
	var resultString: String { get }

	init(anotherValute: Valute)
}
