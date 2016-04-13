//
//  menudish.swift
//  Sweet Grass
//
//  Created by HanFang on 4/6/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

//var arrayOfcart:[cart] = [cart]()
var ca:[String]=[]
var _detail = dish.init(title: "", imageName: "", dishinfo: "",dishprice:"",dishca:"")

class menudish: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var menudishview: UITableView!
    
   

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MenuDish"
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfdishes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menu2: Menu2 = tableView.dequeueReusableCellWithIdentifier("menu2") as! Menu2
        menu2.backgroundColor = UIColor.whiteColor()
        let type = arrayOfdishes[indexPath.row]
        menu2.add.tag = indexPath.row
        menu2.menuId = indexPath.row

        menu2.setCell2(type.dishname,imageName: type.dishimageName)
        return menu2
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     
        _detail = arrayOfdishes[indexPath.row]
//        print(_detail.dishname)
        let detailedViewController = self.storyboard?.instantiateViewControllerWithIdentifier("menudetail")
        self.showViewController(detailedViewController!, sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
