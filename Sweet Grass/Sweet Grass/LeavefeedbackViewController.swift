//
//  LeavefeedbackViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 3/29/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class LeavefeedbackViewController: UIViewController {

    @IBOutlet weak var comments: UITextField!
    
    
    @IBAction func submit(sender: AnyObject) {
        let comment=comments.text!
        
        
        
        
        
        
        func displayMyAlertMessage(userMessage:String)
        {
            
            let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
            
            myAlert.addAction(okAction);
            
            self.presentViewController(myAlert, animated:true, completion:nil);
        }
        
        //Check for empty fields
        if(comment.isEmpty)
        {
            
            // Display alert message
            
            displayMyAlertMessage("Please fill all");
            return;
            
        }
        if (_rating == "")
        {
            // Display alert message
            
            displayMyAlertMessage("Please fill all");
            return;}
            



        // Send user data to the server side
        let myURL = NSURL(string: "http://cgi.soic.indiana.edu/~team17/leavefeedback.php");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST";
        
        let postString = "comment=\(comment)&rating=\(_rating)";
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
                            
                            if( comment == parseJSON["comment"] as? String)
                            {
                                let myAlert = UIAlertController(title: "Alert", message: "Leave feedback successful", preferredStyle: UIAlertControllerStyle.Alert);
                                
                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
                                    self.dismissViewControllerAnimated(true, completion: nil)
                                  
                                   
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FeedBack"
        // Do any additional setup after loading the view.
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
