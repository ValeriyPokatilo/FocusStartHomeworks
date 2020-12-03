//
//  ObserverProtocol.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import Foundation

protocol ObserverProtocol: AnyObject {
	func update(subject: NotificationCentres)
}
