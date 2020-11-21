//
//  ViewController.swift
//  HomeWork-6
//
//  Created by Valeriy Pokatilo on 22.11.2020.
//

import UIKit

protocol ViewControllerProtocol {
	var pingButton: UIButton { get }
}

class ViewController: UIViewController {

	let customView = CustomView()

	// Костыль * Start
	var button = UIButton()
	var switcher = UISwitch()
	var textView = UITextView()
	// Костыль * End

	let notificationCentres = NotificationCentres()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = UIColor.systemBackground
	}

	override func loadView() {
		self.view = customView

		// Костыль * Start
		button = customView.controllersView.pingButton
		button.addTarget(self,
						 action: #selector(buttonTouchUpInside),
						 for: .touchUpInside)

		switcher = customView.controllersView.connectionSwitcher
		switcher.addTarget(self,
						   action: #selector(switchValueChanged),
						   for: .valueChanged)

		textView = customView.logTextView
		// Костыль * End
	}

	@objc func buttonTouchUpInside() {
		notificationCentres.someBussinesLogic()
	}

	@objc func switchValueChanged() {
		if switcher.isOn {
			notificationCentres.subsribe(self)
		} else {
			notificationCentres.unSubscribe(self)
		}
	}
}

extension ViewController: ObserverProtocol {
	func update(subject: NotificationCentres) {
		textView.text = textView.text + ("\(subject.date) Ping state - OK\n")
	}}
