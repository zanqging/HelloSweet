//
//  TBVC1.swift
//  Sweet Grass
//
//  Created by 도다솜 on 2016. 3. 25..
//  Copyright © 2016년 HanFang. All rights reserved.
//

import Foundation
import UIKit


class TableViewController1: UITableViewController {
    
    var names = [String]()
    var identities = [String]()
    
    
    
    override func viewDidLoad() {
        
        names = ["Roasted Tomato","Soup Du Jour."]
        identities = ["G","H"]
        
        
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
        let viewController1  = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        
        self.navigationController?.pushViewController(viewController1!, animated: true)
        
    }
    
    
    
}