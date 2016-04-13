//
//  menubuttonViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 3/31/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

var _cart = Dictionary<String,Double>()


class menubuttonViewController: UIViewController {

    @IBAction func Basket_o_Chips(sender: AnyObject) {
        _cart["Basket O' Chips"]=4.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func Catfish_Tacos(sender: AnyObject) {
        _cart["Catfish Tacos"]=10.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func Shrimp_Tacos(sender: AnyObject) {
        _cart["Shrimp Tacos"]=12.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func Soup_Du_Jour(sender: AnyObject) {
        _cart["Soup Du Jour"]=7.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func Classic_Caesar(sender: AnyObject) {
        _cart["Classic_Caesar"]=7.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func Roasterd_Tomato(sender: AnyObject) {
        _cart["Roasted Tomato"]=7.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func Cotija_Cheese_Fries(sender: AnyObject) {
        _cart["Cotija_Cheese_Fries"]=7.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func PEIMussels(sender: AnyObject) {
        _cart["P.E.I Mussels"]=10.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func Johnny(sender: AnyObject) {
        _cart["Johnny Cake"]=4.95
        let myAlert = UIAlertController(title: "Succeed", message: "Added to cart!", preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: { (UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"

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
