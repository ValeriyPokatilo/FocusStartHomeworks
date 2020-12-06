//
//  CompanyTableViewCell.swift
//  HomeWork-8
//
//  Created by Valeriy Pokatilo on 06.12.2020.
//

import UIKit

final class CompanyTableViewCell: UITableViewCell {
	func configure(company: String) {
		self.textLabel?.text = company
	}
}
