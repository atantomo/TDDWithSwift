//
//  ItemCell.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/31.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()

    func configCell(with item: ToDoItem, checked: Bool = false) {
        if checked {
            let attributedString = NSAttributedString(
                string: item.title,
                attributes: [NSStrikethroughStyleAttributeName:
                    NSUnderlineStyle.styleSingle.rawValue])

            titleLabel.attributedText = attributedString
            locationLabel.text = nil
            dateLabel.text = nil
        } else {
            titleLabel.text = item.title
            locationLabel.text = item.location?.name

            if let timestamp = item.timestamp {
                let date = Date(timeIntervalSince1970: timestamp)
                
                dateLabel.text = dateFormatter.string(from: date)
            } 
        }
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
}
