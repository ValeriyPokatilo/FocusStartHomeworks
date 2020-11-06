//
//  SystemImage.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 05.11.2020.
//

import UIKit

enum SystemImage: String {
	case batteryFull = "battery.100"
	case batteryMiddle = "battery.25"
	case batteryLow = "battery.0"

	var image: UIImage {
		guard let image = UIImage(systemName: self.rawValue) else {
			assertionFailure()
			return UIImage()
		}
		return image
	}
}
