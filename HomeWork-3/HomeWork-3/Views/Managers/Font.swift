//
//  Font.swift
//  HomeWork-3
//
//  Created by Valeriy Pokatilo on 05.11.2020.
//

import UIKit

enum Font {
	case apple10
	case apple14
	case apple18Bold

	public var font: UIFont {
		switch self {
		case .apple10:
			return UIFont.init(name: "AppleSDGothicNeo-Regular", size: 10.0)!

		case .apple14:
			return UIFont.init(name: "AppleSDGothicNeo-Regular", size: 14.0)!

		case .apple18Bold:
			return UIFont.init(name: "AppleSDGothicNeo-Bold", size: 18.0)!
		}
	}
}
