//
//  LocationViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 2/8/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBAction func Locationurl(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.google.com/maps/place/Sweet+Grass+Restaurant/@39.156122,-86.536689,15z/data=!4m2!3m1!1s0x0:0x3ada8cf8a250e6f9?hl=en")! )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Location"

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
