//
//  Process.swift
//  FocusStartHomeworks
//
//  Created by Valeriy Pokatilo on 16.10.2020.
//

final class Process {
	static func process() {

		var currentCommand: String?

		while currentCommand != "exit" {
			currentCommand = readLine()

			switch currentCommand {
			case "help": CommandManager.help()
			case "list": CommandManager.list()
			case "filter": CommandManager.filteredList()
			case "add": CommandManager.add()
			case "exit": MessageManager.exitMessage()
			default: CommandManager.unknown()
			}
		}
	}
}
