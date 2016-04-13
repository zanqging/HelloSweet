//
//  menudetail.swift
//  Sweet Grass
//
//  Created by HanFang on 4/7/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class menudetail: UIViewController {

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ca: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        name.text = _detail.dishname
        des.text = _detail.dishinfo
        ca.text = _detail.dishca
        price.text = _detail.dishprice
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
