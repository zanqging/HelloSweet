//
//  accountmanagementViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 2/9/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class accountmanagementViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "accountmanagement"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openInfo(sender: AnyObject) {
        if _fname == "" {
            // display an alert message
            let myAlert = UIAlertController(title: "Alert", message: "You should Login first", preferredStyle: UIAlertControllerStyle.Alert);
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated: true, completion: nil)
        } else {
            var sb = UIStoryboard(name: "Main", bundle: nil)
            var vc = sb.instantiateViewControllerWithIdentifier("AccountInfo")
            self.showViewController(vc, sender: nil)
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

}
