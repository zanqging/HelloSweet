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
    var dataArray = []
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
        
        self.loadData()
    }
    
    
    func loadData()
    {
        let userid = NSUserDefaults.standardUserDefaults().valueForKey("userid")!
        
        
        //Send user data to server side
        let myURL = NSURL(string:"\(SERVER_URL)getCartList.php");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST"
        
        let postString = "userid=\(userid)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)!;
        
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response:NSURLResponse?, error:NSError?) -> Void in
            //                print(request)
            //                print(data!)
            dispatch_async(dispatch_get_main_queue())
            {
                
                if(error != nil)
                {
                    //Display an alert message
                    let myAlert = UIAlertController(title: "Alert", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert);
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
                    myAlert.addAction(okAction);
                    self.presentViewController(myAlert, animated: true, completion: nil)
                    return
                }
                
                
                
                do {
                    let string : String = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                    print(string)
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                    print(json)
                    if let parseJSON = json {
                        
                        let status = parseJSON["status"] as? String
                        if(status == "200")
                        {
                            self.dataArray = parseJSON["data"] as! NSMutableArray
                            self.tableView.reloadData()
                            
                        } else {
                            // display an alert message
                            let userMessage = parseJSON["message"] as? String
                            let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
                            myAlert.addAction(okAction);
                            self.presentViewController(myAlert, animated: true, completion: nil)
                        }
                        
                    }
                } catch
                {
                    print(error)
                }
                
            }
            
        }).resume()

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
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cartItem: CartItemCell = tableView.dequeueReusableCellWithIdentifier("CartItem") as! CartItemCell
        
        return cartItem
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120;
    }
}
