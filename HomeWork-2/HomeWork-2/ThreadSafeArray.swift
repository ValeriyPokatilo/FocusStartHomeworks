//
//  ThreadSafeArray.swift
//  
//
//  Created by Valeriy Pokatilo on 23.10.2020.
//

struct ThreadSafeArray<Element>{
	var elements = [Element]()

	var isEmpty: Bool {
		return elements.isEmpty ? true : false
	}

	var count: Int {
		return elements.count
	}

	mutating func append(_ item: Element) {
		elements.append(item)
	}

	mutating func remove(at index: Int) {
		elements.remove(at: index)
	}

	subscript(index: Int) -> Element {
		return elements[index]
	}
}
