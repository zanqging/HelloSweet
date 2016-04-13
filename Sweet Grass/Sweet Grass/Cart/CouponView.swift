//
//  CouponView.swift
//  Sweet Grass
//
//  Created by air on 16/4/13.
//  Copyright © 2016年 HanFang. All rights reserved.
//

import Foundation
import UIKit

class CouponView: UIView {
    var textFiled:UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        var singleView = UIView(frame: CGRectMake(0,0,frame.size.width,1))
        singleView.backgroundColor = UIColor.blackColor()
        singleView.alpha = 0.5
        self.addSubview(singleView)
        
        
        let label = UILabel(frame:CGRectMake(20,frame.size.height/2-12.5,70,25))
        label.text = "Coupon"
        label.textColor = UIColor.blackColor()
        self.addSubview(label)
        
        self.textFiled = UITextField(frame:CGRectMake(label.frame.size.width + label.frame.origin.x,frame.size.height/2-17.5,250,35))
        self.textFiled?.placeholder = "Please enter coupon code"
        self.addSubview(self.textFiled!)
        
        singleView = UIView(frame: CGRectMake(0,frame.size.height-1,frame.size.width,1))
        singleView.backgroundColor = UIColor.blackColor()
        singleView.alpha = 0.5
        self.addSubview(singleView)
           
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
