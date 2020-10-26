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
}

private extension ViewController {
	func demonstration() {
		let queue = DispatchQueue.global(qos: .utility)
		
		queue.sync() {
			var threadSafeArray = ThreadSafeArray<Int>()

			for number in 0...1000 {
				threadSafeArray.append(number)
				print("Итерация №\(number + 1), элементов в потокобезопасном массиве \(threadSafeArray.count)")
			}

			print("Итого: \(threadSafeArray.count) элементов в массиве")
		}
	}
}
