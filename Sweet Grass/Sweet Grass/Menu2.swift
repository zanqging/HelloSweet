//
//  Menu2.swift
//  Sweet Grass
//
//  Created by HanFang on 4/6/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class Menu2: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!

    var menuId:Int?
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var add: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell2(name:String,imageName:String)
    {
        self.title.text = name
        self.myImageView.image = UIImage(named:imageName)
        self.add.addTarget(self, action: "addtocart:", forControlEvents:.TouchUpInside)
    }
    
    @IBAction func addtocart(sender:UIButton){
        let userid = NSUserDefaults.standardUserDefaults().valueForKey("userid") as! String
        
        //Send user data to server side
        let myURL = NSURL(string:"\(SERVER_URL)addCart.php");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST"
        
        let postString = "userid=\(userid)&menuid=\(self.menuId)"
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
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDelegate.window?.rootViewController?.showViewController(myAlert, sender: self)
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
                            let userMessage = "Add Success!"
                            let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
                            myAlert.addAction(okAction);
                            
                            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                            appDelegate.window?.rootViewController?.showViewController(myAlert, sender: self)
                            
                        } else {
                            // display an alert message
                            let userMessage = parseJSON["message"] as? String
                            let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
                            myAlert.addAction(okAction);
                            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                            appDelegate.window?.rootViewController?.showViewController(myAlert, sender: self)
                        }
                        
                    }
                } catch
                {
                    print(error)
                }
                
            }
            
        }).resume()
        
    }
    
    
}
