//
//  changeemailViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 3/3/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class changeemailViewController: UIViewController {

 
    
    @IBOutlet weak var ne: UITextField!
    @IBOutlet weak var cfne: UITextField!
    @IBOutlet weak var cp: UITextField!
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ChangeEmail"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savebuttontapped(sender: AnyObject) {
        let newemail=ne.text!
        let confirm=cfne.text!
        let currentpassword=cp.text!
        

        
        
        func displayMyAlertMessage(userMessage:String)
        {
            
            let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
            
            myAlert.addAction(okAction);
            
            self.presentViewController(myAlert, animated:true, completion:nil);
        }
        //Check for empty fields
        if(newemail.isEmpty || confirm.isEmpty || currentpassword.isEmpty)
        {
            
            // Display alert message
            
            displayMyAlertMessage("All fields are required");
            return;
            
        }
        // check password match
        if (currentpassword != _password)
        { //display alert
            displayMyAlertMessage("Password not match")
            return;
        }
        
        // Send user data to the server side
        let myURL = NSURL(string: "http://cgi.soic.indiana.edu/~team17/updateemail.php");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST";
        
        let postString = "new=\(newemail)&old=\(_email)";
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
                            
                            if( newemail == parseJSON["new"] as? String)
                            {
                                let myAlert = UIAlertController(title: "Alert", message: "update successful", preferredStyle: UIAlertControllerStyle.Alert);
                                
                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
                                    _email = newemail
                                    var sb = UIStoryboard(name: "Main", bundle: nil)
                                    var vc = sb.instantiateViewControllerWithIdentifier("AccountInfo")
                                    self.showViewController(vc, sender: nil)
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