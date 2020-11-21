//
//  NotificationCentres.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import Foundation

class NotificationCentres {
	var date: String = {
		return Dater.shared.returnDate()
	}()

	private lazy var observers = [ObserverProtocol]()

	func subsribe(_ observer: ObserverProtocol) {
		print(#function)
		observers.append(observer)
	}

	func unSubscribe(_ observer: ObserverProtocol) {
		if let index = observers.firstIndex(where: { $0 === observer }) {
			observers.remove(at: index)
			print(#function)
		}
	}

	func notify() {
		print(#function)
		observers.forEach( {$0.update(subject: self)} )
	}

	func someBussinesLogic() {
		print(#function)
		date = Dater.shared.returnDate()
		notify()
	}
}
