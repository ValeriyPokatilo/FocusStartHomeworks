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

		//self.demonstration()
	}
}

private extension ViewController {
	func demonstration() {
		let threadSafeArray = ThreadSafeArray<Int>()

		let group = DispatchGroup()

		group.enter()
		DispatchQueue.global(qos: .utility).async {
			for number in 0...1000 {
				threadSafeArray.append(number)
			}
			group.leave()
		}


		group.enter()
		DispatchQueue.global(qos: .utility).async {
			for number in 0...1000 {
				threadSafeArray.append(number)
			}
			group.leave()
		}

		group.wait()

		print("Итого: \(threadSafeArray.count) элементов в массиве")
	}
}
