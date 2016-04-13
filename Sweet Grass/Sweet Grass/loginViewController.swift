//
//  LoginViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 15/11/17.
//  Copyright © 2015年 HanFang. All rights reserved.
//

import UIKit
var _fname = ""
var _lname = ""
var _email = ""
var _phone = ""
var _welcome = ""
var _password = ""
class LoginViewController: UIViewController {
    //MARK: Properties
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        print(userEmail)
        let userPassword = userPasswordTextField.text;
        print(userPassword)
        
        if (userEmail!.isEmpty || userPassword!.isEmpty) {return; }
        
        //Send user data to server side
        let myURL = NSURL(string:"\(SERVER_URL)userLogin.php");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST"
        
        let postString = "userEmail=\(userEmail!)&userPassword=\(userPassword!)"
        print(postString)
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
                            
                        let userId = parseJSON["email"] as? String
                        if(userId != nil)
                        {
                        NSUserDefaults.standardUserDefaults().setObject(parseJSON["email"], forKey: "email")
                        NSUserDefaults.standardUserDefaults().setObject(parseJSON["fname"], forKey: "fname")
                        NSUserDefaults.standardUserDefaults().setObject(parseJSON["lname"], forKey: "lname")
                        NSUserDefaults.standardUserDefaults().setObject(parseJSON["phone"], forKey: "phone")
                        NSUserDefaults.standardUserDefaults().setObject(parseJSON["userid"], forKey: "userid")
                        NSUserDefaults.standardUserDefaults().synchronize()
                            
                            let messageName = parseJSON["fname"] as? String
                            let myAlert = UIAlertController(title: "Success", message: "Welcome \(messageName!)", preferredStyle:  UIAlertControllerStyle.Alert);
                            //let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
                            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                                _fname = (parseJSON["fname"] as? String)!
                                _lname = (parseJSON["lname"] as? String)!
                                _email = (parseJSON["email"] as? String)!
                                _phone = (parseJSON["phone"] as? String)!
                                _welcome = "Welcome! \(_fname)"
                                _password = userPassword!
//                                self.dismissViewControllerAnimated(true, completion: nil)
                                self.navigationController?.popViewControllerAnimated(true)
                                                         })
                            myAlert.addAction(okAction);
                            self.presentViewController(myAlert, animated: true, completion: nil)

                                
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
    
}