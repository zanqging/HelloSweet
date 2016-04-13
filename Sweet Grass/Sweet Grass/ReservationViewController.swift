//
//  ReservationViewController.swift
//  Sweet Grass
//
//  Created by m on 3/6/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var partySize: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var time: UITextField!
    
    //@IBOutlet weak var showDateLabel: UILabel!
    var dateFormatter : NSDateFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reservation"
        self.partySize.delegate = self
        /*
        var datePicker : UIDatePicker = UIDatePicker(frame: CGRectMake(0,210,self.view.frame.size.width,250))
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        self.view.addSubview(datePicker)
        datePicker.addTarget(self, action: "dateChangedAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd 'at' hh:mm a"
        */
        
    }
    
    @IBAction func dateFieldEditing(sender: UITextField) {
        let inputView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 240))
        
        let datePickerView : UIDatePicker = UIDatePicker(frame: CGRectMake(50,5,0,0))
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        inputView.addSubview(datePickerView)
        
        let dateDoneButton = UIButton(frame: CGRectMake((self.view.frame.size.width/2) - (100/2),190,100,50))
        dateDoneButton.setTitle("Done", forState: UIControlState.Normal)
        dateDoneButton.setTitle("Done", forState: UIControlState.Highlighted)
        dateDoneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        dateDoneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        inputView.addSubview(dateDoneButton)
        dateDoneButton.addTarget(self, action: Selector("dateDoneButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        sender.inputView = inputView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        datePickerValueChanged(datePickerView)
    }
    
    @IBAction func timeFieldEditing(sender: UITextField) {
        let inputView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 240))
        let datePickerView : UIDatePicker = UIDatePicker(frame: CGRectMake(50,5,0,0))
        
        datePickerView.datePickerMode = UIDatePickerMode.Time
        inputView.addSubview(datePickerView)
        
        let timeDoneButton = UIButton(frame: CGRectMake((self.view.frame.size.width/2)-(100/2),190,100,50))
        timeDoneButton.setTitle("Done", forState: UIControlState.Normal)
        timeDoneButton.setTitle("Done", forState: UIControlState.Highlighted)
        timeDoneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        timeDoneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        inputView.addSubview(timeDoneButton)
        timeDoneButton.addTarget(self, action: Selector("timeDoneButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        sender.inputView = inputView
        datePickerView.addTarget(self, action: Selector("timePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        timePickerValueChanged(datePickerView)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        date.text = dateFormatter.stringFromDate(sender.date)
        print(date.text!)
        
    }
    
    func timePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        time.text = dateFormatter.stringFromDate(sender.date)
        print(time.text!)
        
    }
    
    func textFieldShouldReturn(partySize: UITextField) -> Bool
    {
        partySize.resignFirstResponder()
        return true;
    }
    
    func dateDoneButton(sender:UIButton)
    {
        date.resignFirstResponder()
    }
    
    func timeDoneButton(sender:UIButton)
    {
        time.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reservationButtonTapped(sender: AnyObject) {
        let userEmail = _email
        print(userEmail)
        let size=partySize.text
        let d=date.text
        let t=time.text
        
        func displayMyAlertMessage(userMessage:String)
        {
            
            let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
            
            myAlert.addAction(okAction);
            
            self.presentViewController(myAlert, animated:true, completion:nil);
        }
        
        
        
        //Check for party size
        if(size!.isEmpty || d!.isEmpty || t!.isEmpty)
        {
            
            // Display alert message
            
            displayMyAlertMessage("All fields are required");
            return;
            
        }
        
        
        // check party size
        if ( Int(size!)! > 6  || Int(size!)! < 1)
        {
            displayMyAlertMessage("Party size must be between 1 and 6");
            return;
            
        }
        
        
        
        
        if _email != ""{
            
            
            
            
            
            
            
            // Send user data server side
            let myURL = NSURL(string: "http://cgi.soic.indiana.edu/~team17/makeReservation.php");
            let request = NSMutableURLRequest(URL:myURL!);
            request.HTTPMethod = "POST";
            
            let postString = "userEmail=\(userEmail)&partySize=\(size!)&d=\(d!)&t=\(t!)";
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
                            print(3)
                            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                            print(4)
                            print(json)
                            
                            if let parseJSON = json {
                                
                                let userId = parseJSON["size"] as? String
                                
                                if( userId != nil)
                                {
                                    let myAlert = UIAlertController(title: "Alert", message: "Reservation successful", preferredStyle: UIAlertControllerStyle.Alert);
                                    
                                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){(action) in
                                        
                                        self.dismissViewControllerAnimated(true, completion: nil)
                                    }
                                    
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
        else{
            let myAlert = UIAlertController(title: "Not logged in", message: "Users must log in first to make reservation", preferredStyle:  UIAlertControllerStyle.ActionSheet);
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler:nil)
            let loginAction = UIAlertAction(title: "Log in", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                
                
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewControllerWithIdentifier("login")
                self.showViewController(vc, sender: nil)
            })
            let signupAction = UIAlertAction(title: "Sign up", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                
                
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewControllerWithIdentifier("signup")
                self.showViewController(vc, sender: nil)
            })
            
            myAlert.addAction(loginAction)
            myAlert.addAction(signupAction)
            myAlert.addAction(cancelAction)
            self.presentViewController(myAlert, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    func displayAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title: "Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


