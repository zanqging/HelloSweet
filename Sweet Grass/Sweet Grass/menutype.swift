//
//  menutype.swift
//  Sweet Grass
//
//  Created by HanFang on 4/6/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

var arrayOfdishes:[dish] = [dish]()

class menutype: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var menutypeView: UITableView!
    var arrayOftypes:[type] = [type]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpType()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpType()
    {
        let appetizers = type(title:"Appetizers", imageName: "appetizer")
        let soups = type(title:"Soups",imageName: "soup")
        let greens = type(title:"Greens",imageName: "garden greens")
        let sideitems = type(title:"Side Items",imageName: "side item")
        let sandwhiches = type(title:"Sandwhiches",imageName: "sandwich")
        let entrees = type(title:"Entrees",imageName: "The Hog Heaven")
        arrayOftypes.append(appetizers)
        arrayOftypes.append(soups)
        arrayOftypes.append(greens)
        arrayOftypes.append(sideitems)
        arrayOftypes.append(sandwhiches)
        arrayOftypes.append(entrees)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOftypes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menu1: Menu1 = tableView.dequeueReusableCellWithIdentifier("menu1") as! Menu1
//        menu1.backgroundColor = UIColor.whiteColor()
        let type = arrayOftypes[indexPath.row]
        
        menu1.setCell(type.title,imageName: type.imageName)
        
        return menu1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let types = ["Appetizers", "Soups","Greens", "Side Items", "Sandwiches", "Entrees"]
        var _menutype = indexPath.row
        print(_menutype)
        //Send user data to server side
        let myURL = NSURL(string:"http://cgi.soic.indiana.edu/~team17/getmenu.php");
        let request = NSMutableURLRequest(URL:myURL!);
        
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response:NSURLResponse?, error:NSError?) -> Void in
            
            dispatch_async(dispatch_get_main_queue())
                {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                        arrayOfdishes = [dish]()
                        for (key,val) in json! {
                            let shabi = (val as! NSDictionary)["type"] as! String
                            if(shabi==types[_menutype]) {
                                
                                let currentdish = val as! NSDictionary
                                arrayOfdishes.append(dish(title: key as! String,
                                    imageName: "blank",
                                    dishinfo: currentdish["description"] as! String,
                                    dishprice: currentdish["price"] as! String,
                                    dishca: currentdish["calories"] as! String))
                            }
                        }
                        
                        let detailedViewController = self.storyboard?.instantiateViewControllerWithIdentifier("menudish")
                        self.showViewController(detailedViewController!, sender: nil)
                    } catch {
                        print(error)
                    }
            }
        }).resume()
    }
    
    


}
