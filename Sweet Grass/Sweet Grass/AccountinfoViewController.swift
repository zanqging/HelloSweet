//
//  AccountinfoViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 3/3/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class AccountinfoViewController: UIViewController {

    @IBOutlet weak var aifn: UILabel!
    @IBOutlet weak var ailn: UILabel!
    @IBOutlet weak var aiemail: UILabel!
    @IBOutlet weak var aiphone: UILabel!
    @IBAction func changeemailbutton(sender: AnyObject) {var sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewControllerWithIdentifier("changeemail")
        self.showViewController(vc, sender: nil)
    }
    @IBAction func changeinfobutton(sender: AnyObject) {
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewControllerWithIdentifier("changeinfo")
        self.showViewController(vc, sender: nil)
    }
    @IBAction func changepasswordbutton(sender: AnyObject) {
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewControllerWithIdentifier("changepassword")
        self.showViewController(vc, sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        aifn.text = _fname
        ailn.text = _lname
        aiemail.text = _email
        aiphone.text = _phone
        self.title = "AccountInfo"
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
