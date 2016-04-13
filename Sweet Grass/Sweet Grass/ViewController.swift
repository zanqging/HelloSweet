//
//  ViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 15/11/16.
//  Copyright (c) 2015年 HanFang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func menubttn(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("menutype")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
   
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var signout: UIButton!
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var test: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**
         *  left navigationItem
         */
        let leftItem=UIBarButtonItem(title: "Signin", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("SignInAction:"))
        self.navigationItem.leftBarButtonItem=leftItem
        /**
         *  right navigationItem
         */
        let rightItem=UIBarButtonItem(title: "Cart", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("goCartAction:"))
        self.navigationItem.rightBarButtonItem=rightItem
        
        test.text = _welcome
//        if _email != "" {
//            signin.hidden = true
//            signup.hidden = true
//            signout.hidden = false
//            
//        } else {
//            signin.hidden = false
//            signup.hidden = false
//            signout.hidden = true
//        }
        
        //接受消息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("message"), name: "message", object: nil)
    }
    
    
    func message(notification:NSNotification)
    {
        let userInfo = notification.userInfo as! NSDictionary
        let message = userInfo.valueForKey("message") as! String
        let myAlert = UIAlertController(title: "Message", message: message, preferredStyle:  UIAlertControllerStyle.ActionSheet);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    /**
     SignIn Action
     - parameter sender: taped ButtonItem
     */
    func SignInAction(sender:AnyObject)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("login")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /**
     Cart Action
     - parameter sender: taped ButtonItem
     */
    func goCartAction(sender:AnyObject)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("CartList")
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func signoutbttapped(sender: AnyObject) {
        let myAlert = UIAlertController(title: "Logout", message: "Are you sure to Logout?", preferredStyle:  UIAlertControllerStyle.ActionSheet);
        let cancelAction = UIAlertAction(title: "Nooooo", style: UIAlertActionStyle.Default, handler:nil)
        let okAction = UIAlertAction(title: "OKKKKK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            _email = ""
            _fname = ""
            _lname = ""
            _phone = ""
            _welcome = ""
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewControllerWithIdentifier("index")
//            self.showViewController(vc, sender: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        })
        myAlert.addAction(okAction)
        myAlert.addAction(cancelAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

}

