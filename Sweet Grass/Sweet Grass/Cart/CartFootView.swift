//
//  CartFootView.swift
//  Sweet Grass
//
//  Created by air on 16/4/12.
//  Copyright © 2016年 HanFang. All rights reserved.
//

import Foundation
import UIKit

class CartFootView: UIView {
    var pickUpButton:UIButton?
    var checkOutButton:UIButton?
    var totalLabel:UILabel?
    override init(frame: CGRect) {
         super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        let text = "Total:$22(tax:$1.76)"
        totalLabel = UILabel(frame:CGRectMake(0,5,frame.size.width,20))
        totalLabel?.text = "Total:$22(tax:$1.76)"
        totalLabel?.textAlignment = .Center
        let attributedString = NSMutableAttributedString(string: text)
        let len = text.characters.count
        
        
        
        var attributes:Dictionary<String,AnyObject> = [:]
        
        attributes[NSFontAttributeName] = UIFont(name: "Arial", size: 16)
        attributes[NSForegroundColorAttributeName] = UIColor(red: 221/255, green: 61/255, blue: 149/255, alpha: 1)
        
        attributedString.addAttributes(attributes,range:NSMakeRange(6,3))
        
        totalLabel!.attributedText = attributedString;
        
        self.addSubview(totalLabel!)
            
        
        pickUpButton = UIButton(frame:CGRectMake(40,25,120,35))
        pickUpButton?.layer.cornerRadius = 5
        pickUpButton?.setTitle("PickUpTime", forState: .Normal)
        pickUpButton?.backgroundColor = UIColor(red:253, green:128/255, blue:0/255,alpha:1)
        
        self.addSubview(pickUpButton!)
        
        checkOutButton = UIButton(frame:CGRectMake(self.frame.size.width/2 + 35,25,120,35))
        checkOutButton?.layer.cornerRadius = 5
        checkOutButton?.setTitle("CheckOut", forState: .Normal)
        checkOutButton?.backgroundColor = UIColor(red:253, green:128/255, blue:0/255,alpha:1)
        
        self.addSubview(checkOutButton!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
