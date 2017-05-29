//
//  ToDoItem.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/28.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?

    init(title: String, itemDescription: String? = nil) {
        self.title = title
        self.itemDescription = itemDescription
    } 
}
