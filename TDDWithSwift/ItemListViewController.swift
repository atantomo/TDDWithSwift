//
//  ItemListViewController.swift
//  TDDWithSwift
//
//  Created by Andrew Tantomo on 2017/05/27.
//  Copyright © 2017年 Andrew Tantomo. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & ItemManagerSettable)! 

    let itemManager = ItemManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataProvider.itemManager = itemManager
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showDetails(sender:)),
            name: NSNotification.Name("ItemSelectedNotification"),
            object: nil) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func addItem(_ sender: AnyObject) {
        if let nextViewController =
            storyboard?.instantiateViewController(
                withIdentifier: "InputViewController")
                as? InputViewController {

            nextViewController.itemManager = self.itemManager
            present(nextViewController, animated: true, completion: nil)
        } 
    }

    func showDetails(sender: NSNotification) {
        guard let index = sender.userInfo?["index"] as? Int else
        { fatalError() }

        if let nextViewController = storyboard?.instantiateViewController(
            withIdentifier: "DetailViewController") as? DetailViewController {

            nextViewController.itemInfo = (itemManager, index)
            navigationController?.pushViewController(nextViewController,
                                                     animated: true) 
        } 
    } 

}

