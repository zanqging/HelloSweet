//
//  HistoryOrderListViewController.swift
//  Sweet Grass
//
//  Created by air on 16/4/12.
//  Copyright © 2016年 HanFang. All rights reserved.
//

import UIKit
import Foundation
class HistoryOrderListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HistoryOrder"
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cartItem: CartItemCell = tableView.dequeueReusableCellWithIdentifier("CartItem") as! CartItemCell
        
        return cartItem
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120;
    }
}
