//
//  TBVC3.swift
//  Sweet Grass
//
//  Created by 도다솜 on 2016. 3. 25..
//  Copyright © 2016년 HanFang. All rights reserved.
//

import Foundation
import UIKit

class TableViewController3: UITableViewController {
    
    
    var names = [String]()
    var identities = [String]()
    
    override func viewDidLoad() {
        
        
        names = ["The Hog Heaven","Chicken Salad Sandwich","Dixie Chicken Sandwich","Fried Green Tomato B.L.T","Grilled Vegetable Melt","The Cutter Classic","Pimento Burger","Hoosier Daddy Burger","Smoke Shack Burger","Shaved Pork Loin","Southern Belle Burger","Shrimp Po Boy"]
        
        identities = ["M","N","O","P","Q","R","S","T","U","V","W","X"]
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
        
        let viewController3 = storyboard?.instantiateViewControllerWithIdentifier(vcName)
    
        self.navigationController?.pushViewController(viewController3!, animated: true)
    
    }

}