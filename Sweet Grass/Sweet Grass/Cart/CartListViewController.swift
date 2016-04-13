//
//  CartListViewController.swift
//  Sweet Grass
//
//  Created by air on 16/4/12.
//  Copyright © 2016年 HanFang. All rights reserved.
//

import Foundation
import UIKit

class CartListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let frame = self.view.frame
        
        let cartFooterView =  CartFootView(frame: CGRectMake(0,frame.size.height-70,frame.size.width,80))
        cartFooterView.pickUpButton?.addTarget(self, action: Selector("pickUpTimer:"), forControlEvents: .TouchUpInside)
        cartFooterView.checkOutButton?.addTarget(self, action: Selector("checkOut:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(cartFooterView)
        
        let couponView = CouponView(frame:CGRectMake(0,0,frame.size.width,100))
        self.tableView.tableFooterView = couponView
    }
    
    /**
     pickUpTimer
     
     - parameter sender: button
     */
    func pickUpTimer(sender:AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("pickuptime")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /**
     checkOut
     
     - parameter sender: button
     */
    func checkOut(sender:AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("menutype")
        self.navigationController?.pushViewController(vc, animated: true)
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
