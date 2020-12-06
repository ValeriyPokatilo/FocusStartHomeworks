//
//  PersonTableViewCell.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
	class PersonTableViewCell: UITableViewCell {
		func configure(_ person: Person) {
			self.textLabel?.text = person.name
		}
	}
}
