//
//  AssetsImage.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 08.11.2020.
//

import UIKit

enum AssetsImage: String {
	case iphone4front = "iphone-4-front"
	case iphone4rear = "iphone-4-rear"
	case iphone5front = "iphone-5-front"
	case iphone5rear = "iphone-5-rear"

	var image: UIImage {
		guard let image = UIImage(named: self.rawValue) else {
			assertionFailure()
			return UIImage()
		}
		return image
	}
}
