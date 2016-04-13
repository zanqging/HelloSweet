//
//  CartViewController.swift
//  Sweet Grass
//
//  Created by HanFang on 16/1/22.
//  Copyright © 2016年 HanFang. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {


    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var cart: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
//        var shopping:[String:Double] = ["cai1":2,"cai2":3,"cai3":5]
        
        var s=""
        var sum = 0.0
        for (item,price) in _cart {
            s+=item
            s+="     Price: "
            s+="\(price)"
            sum += price
            s+="\n"
        }
        cart.text = s
        subtotal.text = "$\(sum)"
        tax.text = "$\(sum*0.07)"
        total.text = "$\(sum*1.07)"
        
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
