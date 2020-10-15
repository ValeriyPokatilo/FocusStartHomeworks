//
//  Process.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

import Foundation

class Process {

	static let shared = Process()

	func process() {

		var currentCommand: String?

		while currentCommand != "exit" {

			currentCommand = readLine()

			switch currentCommand {
			case "help": CommandManager.shared.help()
			case "ls": CommandManager.shared.ls()
			case "ls -body": CommandManager.shared.lsFilter()
			case "add": CommandManager.shared.add()
			case "exit": MessageManager.shared.exitMessage()
			default: CommandManager.shared.unknown()
			}
		}
	}
}
