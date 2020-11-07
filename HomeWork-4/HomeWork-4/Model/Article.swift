//
//  Article.swift
//  HomeWork-4
//
//  Created by Valeriy Pokatilo on 08.11.2020.
//

import Foundation

struct Article {
	let title: String
	let text: String
	let time: String?

	static func returnArticle() -> [Article] {
		let articles = [
			Article(title: "Статья 1", text: "Текст 1", time: "22:30"),
			Article(title: "Статья 2", text: "Текст 2", time: "09:17"),
			Article(title: "Статья 3", text: "Текст 3", time: "16:07"),
			Article(title: "Статья 4", text: "Текст 4", time: "23:59"),
			Article(title: "Статья 5", text: "Текст 5", time: "07:45"),
			Article(title: "Статья 6", text: "Текст 6", time: "19:45"),
		]

		return articles
	}
}
