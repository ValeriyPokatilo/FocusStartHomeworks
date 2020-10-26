//
//  ThreadSafeArray.swift
//
//
//  Created by Valeriy Pokatilo on 23.10.2020.
//
struct ThreadSafeArray<Element> {
	private var elements = [Element]()

	var isEmpty: Bool {
		return self.elements.isEmpty
	}

	var count: Int {
		return self.elements.count
	}

	mutating func append(_ item: Element) {
		self.elements.append(item)
	}

	mutating func remove(at index: Int) {
		self.elements.remove(at: index)
	}

	subscript(index: Int) -> Element {
		return self.elements[index]
	}
}
