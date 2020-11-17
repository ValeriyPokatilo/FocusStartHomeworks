//
//  AssetsImage.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 08.11.2020.
//

import UIKit

enum AssetsImage: String {
	case iphone0front = "iphone-0-front"
	case iphone0rear = "iphone-0-rear"
	case iphone2front = "iphone-2-front"
	case iphone2rear = "iphone-2-rear"
	case iphone4front = "iphone-4-front"
	case iphone4rear = "iphone-4-rear"
	case iphone8front = "iphone-8-front"
	case iphone8rear = "iphone-8-rear"
	case iphoneXfront = "iphone-X-front"
	case iphoneXrear = "iphone-X-rear"
	case iphone12front = "iphone-12-front"
	case iphone12rear = "iphone-12-rear"

	var image: UIImage {
		guard let image = UIImage(named: self.rawValue) else {
			assertionFailure()
			return UIImage()
		}
		return image
	}
}
