//
//  TBVC4.swift
//  Sweet Grass
//
//  Created by 도다솜 on 2016. 3. 26..
//  Copyright © 2016년 HanFang. All rights reserved.
//

import Foundation
import UIKit


class TableviewController4: UITableViewController {
    
    var names = [String]()
    var identities = [String]()
    
    
    
    override func viewDidLoad() {
        names = ["Collard Greens","Aspargus","Fried okra","Side Caesar","Carolina Slaw","House Fries","Green Beans","Side Salad","Mashed Potatoes","Grit Cake","Fresh Cut Chips","Sweet Potato Fries"]
        
        identities = ["AB","CD","EF","GH","IJ","KL","MN","OP","QR","ST","UV","WX"]
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
        let viewController4 = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        self.navigationController?.pushViewController(viewController4!, animated: true)
   
    
    }

}