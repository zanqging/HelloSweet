//
//  SidemenuViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 2/8/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class SidemenuViewController: UIViewController {

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    @IBAction func menubutton(sender: AnyObject) {
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewControllerWithIdentifier("menutype")
        self.showViewController(vc, sender: nil)
        

    }
    @IBAction func AboutURL(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://sweetgrassbloomington.com/about-sweet-grass/")!)
    }
    @IBAction func Contacturl(sender: AnyObject) {UIApplication.sharedApplication().openURL(NSURL(string:"http://sweetgrassbloomington.com/contact/")!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SlideMenu"
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
