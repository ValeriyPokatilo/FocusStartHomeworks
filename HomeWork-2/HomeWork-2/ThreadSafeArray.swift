//
//  ThreadSafeArray.swift
//
//
//  Created by Valeriy Pokatilo on 23.10.2020.
//

import Foundation

final class ThreadSafeArray<Element> {
	private var elements = [Element]()

	private let queue = DispatchQueue(label: "DispatchBarrier", attributes: .concurrent)

	var isEmpty: Bool {
		var result: Bool!
		self.queue.async(flags: .barrier) {
			result = self.elements.isEmpty
		}
		return result
	}

	var count: Int {
		var result: Int!
		self.queue.async(flags: .barrier) {
			result = self.elements.count
		}
		return result
	}

	func append(_ item: Element) {
		self.queue.async(flags: .barrier) {
			self.elements.append(item)
		}
	}

	func remove(at index: Int) {
		self.queue.async(flags: .barrier) {
			self.elements.remove(at: index)
		}
	}

	subscript(index: Int) -> Element? {
		var element: Element?
		self.queue.async(flags: .barrier) {
			let diapason = 0..<self.elements.count
			if diapason ~= index {
				element = self.elements[index]
			}
		}
		return element
	}
}

extension ThreadSafeArray where Element: Equatable {
	func containce(_ element: Element) -> Bool {
		var result: Bool!
		self.queue.async(flags: .barrier) {
			result = self.elements.contains(element)
		}
		return result
	}
}
