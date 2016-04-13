//
//  TBVC2.swift
//  Sweet Grass
//
//  Created by 도다솜 on 2016. 3. 25..
//  Copyright © 2016년 HanFang. All rights reserved.
//

import Foundation
import UIKit

class TableViewController2: UITableViewController {
    
    var names = [String]()
    var identites = [String]()
    
    override func viewDidLoad() {
        
        names = ["Steak Salad","Classic Caesar","Seabrooke Revival","Garden Greens"]
        identites = ["I","J","K","L"]
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
        let vcName = identites[indexPath.row]
        let viewController2 = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        self.navigationController?.pushViewController(viewController2!, animated: true)
    
    }



}