//
//  Register.swift
//  Sweet Grass
//
//  Created by HanFang on 15/11/17.
//  Copyright © 2015年 HanFang. All rights reserved.
//

import UIKit

class Register: UIViewController {

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var userFirstName: UITextField!
    @IBOutlet weak var userLastName: UITextField!
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userphone: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var repeatpassword: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registe"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerbuttontapped(sender: AnyObject) {
        let userfn=userFirstName.text
        let userln=userLastName.text
        let userEmail=useremail.text
        let userPhone=userphone.text
        let userPassword=userpassword.text
        let userrepeatpassword = repeatpassword.text
        
        func displayMyAlertMessage(userMessage:String)
        {
            
            let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
            
            myAlert.addAction(okAction);
            
            self.presentViewController(myAlert, animated:true, completion:nil);
        }
        
        
        func isValidEmail(testStr:String) -> Bool {
            
            print("validate emailId: \(testStr)")
            
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            
            let result = emailTest.evaluateWithObject(testStr)
            
            return result
            
        }
        
        func isValidPhone(value: String) -> Bool {
            
            //let phoneRegEx = "\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$"
            
            let phoneRegEx = "^^\\d{3}\\d{4}\\d{4}$"
            
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
            
            let result =  phoneTest.evaluateWithObject(value)
            
            return result}
        
        // Check Phone
        if (!isValidPhone(userPhone!))
        {
            displayMyAlertMessage("Please enter a valid phone number")
            return
        }
        
         //Check for empty fields
        if(userfn!.isEmpty || userln!.isEmpty || userEmail!.isEmpty || userPhone!.isEmpty || userPassword!.isEmpty)
        {
            
            // Display alert message
            
            displayMyAlertMessage("All fields are required");
            return;

        }
        
        
        // check email
        if (!isValidEmail(userEmail!))
        {
            displayMyAlertMessage("Email wrong")
            return
            
        }
        
        
        //check repeat password
        if (userPassword != userrepeatpassword)
        { //display alert
            displayMyAlertMessage("Password not match")
            return;
        }
//
//        
//
        
        
        // Send user data to the server side
        let myURL = NSURL(string: "\(SERVER_URL)userRegister.php");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST";
        
        let postString = "userEmail=\(userEmail!)&userFirstName=\(userfn!)&userLastName=\(userln!)&userPassword=\(userPassword!)&userPhone=\(userPhone!)";
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
                        let string : String = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                        print(string)
                        
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                        
                        print(json)
                        
                        if let parseJSON = json {
                            
                            let userId = parseJSON["email"] as? String
                            
                            if( userId != nil)
                            {
                                let myAlert = UIAlertController(title: "Alert", message: "Registration successful", preferredStyle: UIAlertControllerStyle.Alert);
                                
                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
                                  self.dismissViewControllerAnimated(true, completion: nil)                                })
                                
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
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            
            var sb = UIStoryboard(name: "Main", bundle: nil)
            var vc = sb.instantiateViewControllerWithIdentifier("index")
            self.showViewController(vc, sender: nil)
            
        })
        
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
}
        
        

        