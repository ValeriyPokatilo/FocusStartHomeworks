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
		return self.queue.sync {
			self.elements.isEmpty
		}
	}

	var count: Int {
		return self.queue.sync {
			self.elements.count
		}
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

	subscript(index: Int) -> Element {
		return self.queue.sync {
			if self.elements.indices.contains(index) {
				return self.elements[index]
			} else {
				fatalError("Массив не содержит элемента по указанному индексу")
			}
		}
	}
}

extension ThreadSafeArray where Element: Equatable {
	func containce(_ element: Element) -> Bool {
		return self.queue.sync {
			self.elements.contains(element)
		}
	}
}
