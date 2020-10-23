//
//  ViewController.swift
//  HomeWork-2
//
//  Created by Valeriy Pokatilo on 23.10.2020.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		demonstration()
	}

	func demonstration() {
		let queue = DispatchQueue(label: "", attributes: .concurrent)

		queue.async(flags: .barrier) {
			var threadSafeArray = ThreadSafeArray<Int>()

			for number in 0...1000 {
				threadSafeArray.append(number)
				//print("Итерация №\(number), элементов в потокобезопасном массиве \(self.threadSafeArray.count)")
			}

			print("Итого: \(threadSafeArray.count) элементов в массиве")
		}
	}
}

