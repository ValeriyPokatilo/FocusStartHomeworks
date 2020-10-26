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
		return self.elements.isEmpty
	}

	var count: Int {
		return self.elements.count
	}

	func append(_ item: Element) {
		queue.async(flags: .barrier) {
			self.elements.append(item)
		}
	}

	func remove(at index: Int) {
		queue.async(flags: .barrier) {
			self.elements.remove(at: index)
		}
	}

	subscript(index: Int) -> Element {
		return self.elements[index]
	}
}
