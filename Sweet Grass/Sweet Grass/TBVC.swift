//
//  TBVC.swift
//  Sweet Grass
//
//  Created by 도다솜 on 2016. 3. 25..
//  Copyright © 2016년 HanFang. All rights reserved.
//


import Foundation
import UIKit


class TableViewController: UITableViewController {
    
    
    
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    var names = [String]()
    var identities = [String]()
    
    
    override func viewDidLoad() {
        
        
        names = ["P.E.I.Mussels","Basket O' Chips","Johnny Cake","Catfish Tacos", "Cotija Cheese Fries", "Shrimp Tacos"]
        identities = ["A","B","C","D","E","F"]
        
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        
        cell?.textLabel!.text = names[indexPath.row]
    
        return cell!
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController  = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    
    
    
}