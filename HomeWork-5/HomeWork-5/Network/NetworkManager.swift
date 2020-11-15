//
//  NetworkManager.swift
//  HomeWork-5
//
//  Created by Valeriy Pokatilo on 15.11.2020.
//

import Foundation

final class NetworkManager {

	static let shared = NetworkManager()

	func getExchangeRate(complition: @escaping (_ currentValutes: [CurrentValute]) -> ()) {
		var valutes: [CurrentValute] = []

		let jsonUrlString = "https://www.cbr-xml-daily.ru/daily_json.js"
		guard let url = URL(string: jsonUrlString) else { return }

		URLSession.shared.dataTask(with: url) { (data, responce, error) in
			guard let data = data else { return }

			do {
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .custom({ keys -> CodingKey in
					let key = keys.first!.stringValue.lowercased() //+ keys.dropFirst()
					return String(key) as! CodingKey
				})
				let today = try decoder.decode(TodayRate.self, from: data)

				for (_, valute) in today.Valute {
					if valute.charCode != "XDR" {
						valutes.append(valute)
					}
				}
				complition(valutes)
			} catch let error {
				print(error.localizedDescription)
			}
		}.resume()
	}
}
