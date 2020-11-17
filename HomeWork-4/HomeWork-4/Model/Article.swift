//
//  Article.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 08.11.2020.
//

import UIKit

struct Article {
	let title: String
	let preText: String
	let text: String
	let time: String?
	let topImage: UIImage
	let bottomImage: UIImage

	static func returnArticle() -> [Article] {
		let articles = [
			Article(title: Text.iphone2Header,
					preText: Text.iphone2PreText,
					text: Text.iphone2Text,
					time: Text.iphone2Time,
					topImage: AssetsImage.iphone2front.image,
					bottomImage: AssetsImage.iphone2rear.image),
			Article(title: Text.iphone4Header,
					preText: Text.iphone4PreText,
					text: Text.iphone4Text,
					time: Text.iphone4Time,
					topImage: AssetsImage.iphone4front.image,
					bottomImage: AssetsImage.iphone4rear.image),
			Article(title: Text.iphone8Header,
					preText: Text.iphone8PreText,
					text: Text.iphone8Text,
					time: Text.iphone8Time,
					topImage: AssetsImage.iphone8front.image,
					bottomImage: AssetsImage.iphone8rear.image),
			Article(title: Text.iphoneXHeader,
					preText: Text.iphoneXPreText,
					text: Text.iphoneXText,
					time: Text.iphoneXTime,
					topImage: AssetsImage.iphoneXfront.image,
					bottomImage: AssetsImage.iphoneXrear.image),
			Article(title: Text.iphone12Header,
					preText: Text.iphone12PreText,
					text: Text.iphone12Text,
					time: Text.iphone12Time,
					topImage: AssetsImage.iphone12front.image,
					bottomImage: AssetsImage.iphone12rear.image)
		]

		return articles
	}
}
