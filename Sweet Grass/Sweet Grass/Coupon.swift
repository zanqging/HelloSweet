//
//  CouponViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 4/1/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

var _discount = 0.0

class CouponController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var CouponField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Coupon"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func CouponSubmit(sender: AnyObject) {
        
        
        let code = CouponField.text
        
        //Check for empty fields
        if(code!.isEmpty)
        {
            func displayMyAlertMessage(userMessage:String)
            {
                
                let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
                
                let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
                
                myAlert.addAction(okAction);
                
                self.presentViewController(myAlert, animated:true, completion:nil);
            }
            
            // Display alert message
            
            displayMyAlertMessage("All fields are required");
            return;
            
        }
        
        
        
        
        
        
        // Send user data to the server side
        let myURL = NSURL(string: "http://cgi.soic.indiana.edu/~team17/coupon.php");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST";
        
        let postString = "code=\(code!)";
        print(postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            
            dispatch_async(dispatch_get_main_queue())
                {
                    
                    
                    if error != nil {
                        self.displayAlertMessage(error!.localizedDescription)
                        return
                    }
                    
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                        
                        print(json)
                        
                        if let parseJSON = json {
                            
                            if ((parseJSON["discount"] as? String) != nil)
                            {
                                NSUserDefaults.standardUserDefaults().setObject(parseJSON["discount"], forKey: "discount")
                                
                                let myAlert = UIAlertController(title: "Alert", message: "Coupon Applied", preferredStyle: UIAlertControllerStyle.Alert);
                                
                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
                                    let dis = (parseJSON["discount"] as? String)!
                                    _discount = Double(dis)!
                                    
                                    
                                    
                                })
                                
                                myAlert.addAction(okAction);
                                self.presentViewController(myAlert, animated: true, completion: nil)
                            } else {
                                let errorMessage = parseJSON["message"] as? String
                                if(errorMessage != nil)
                                {
                                    self.displayAlertMessage(errorMessage!)
                                }
                                
                            }
                            
                        }
                    } catch{
                        print(error)
                    }
                    
                    
                    
            }
            
        }).resume()
        
        
    }
    
    func displayAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
