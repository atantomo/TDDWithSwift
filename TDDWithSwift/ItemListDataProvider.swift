//
//  ItemListDataProvider.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/28.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import UIKit

enum Section: Int {
    case toDo
    case done
}

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {

    var itemManager: ItemManager?

//    override init() {
//        super.init()
//        self.itemManager = ItemManager()
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let itemManager = itemManager else { return 0 }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }

        switch itemSection {
        case .toDo:
            return itemManager.toDoCount
        case .done:
            return itemManager.doneCount
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell

        if let item = itemManager?.item(at: indexPath.row) {
            cell.configCell(with: item)
        }

        guard let itemManager = itemManager else { fatalError()
        }
        guard let itemSection = Section(rawValue: indexPath.section) else {
            fatalError()
        }

        switch itemSection {
        case .toDo:
            cell.configCell(with: itemManager.item(at:indexPath.row))
        case .done:
            cell.configCell(with: itemManager.doneItem(at: indexPath.row))
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {

        guard let section = Section(rawValue: indexPath.section) else
        {
            fatalError()
        }

        let buttonTitle: String
        switch section {
        case .toDo:
            buttonTitle = "Check"
        case .done: 
            buttonTitle = "Uncheck" 
        } 

        return buttonTitle 
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        guard let section = Section(rawValue: indexPath.section) else
        {
            fatalError()
        }

        switch section {
        case .toDo:
            itemManager?.checkItem(at: indexPath.row)
        case .done:
            itemManager?.uncheckItem(at: indexPath.row)
        }
        tableView.reloadData()
    }

}
