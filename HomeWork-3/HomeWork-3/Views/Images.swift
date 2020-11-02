//
//  Images.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 02.11.2020.
//

import UIKit

enum Images: String {
	case loremIpsum

	var image: UIImage {
		guard let image = UIImage(named: self.rawValue) else {
			assertionFailure()
			return UIImage()
		}
		return image
	}
}
