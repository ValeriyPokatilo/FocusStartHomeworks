//
//  ViewController.swift
//  HomeWork-2
//
//  Created by Valeriy Pokatilo on 23.10.2020.
//

import UIKit

class ViewController: UIViewController {

	var threadSafeArray = ThreadSafeArray<Int>()

	override func viewDidLoad() {
		super.viewDidLoad()

		demonstration()
	}

	func demonstration() {
		let queue = DispatchQueue(label: "", attributes: .concurrent)

		queue.async(flags: .barrier) {
			for number in 0...1000 {
				self.threadSafeArray.append(number)
				print("Итерация №\(number), элементов в потокобезопасном массиве \(self.threadSafeArray.count)")
			}

			print("Итого: \(self.threadSafeArray.count) элементов в массиве")
		}
	}
}

