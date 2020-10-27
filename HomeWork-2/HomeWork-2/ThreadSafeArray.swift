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
		return queue.sync {
			self.elements.isEmpty
		}
	}

	var count: Int {
		return queue.sync {
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
		return queue.sync {
			if 0..<self.elements.count ~= index {
				return self.elements[index]
			} else {
				fatalError()
			}
		}
	}
}

extension ThreadSafeArray where Element: Equatable {
	func containce(_ element: Element) -> Bool {
		return queue.sync {
			self.elements.contains(element)
		}
	}
}
