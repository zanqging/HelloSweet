//
//  trackingview.swift
//  Sweet Grass
//
//  Created by yangshu lin on 3/28/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

@IBDesignable class MyProgressBar: UIView {
    
    
    private let textLabel = UILabel()
    
    private let bar = UIView()
    
    @IBInspectable var percent: Int = 0 {
        didSet {
            if percent > 100 {
                percent = 100
            }else if percent < 0 {
                percent = 0
            }
            textLabel.text =  "\(percent)%"
            setNeedsLayout()
        }
    }
    
    @IBInspectable var color: UIColor = .whiteColor() {
        didSet {
            textLabel.textColor = color
        }
}

   
    @IBInspectable var barColor: UIColor = UIColor.orangeColor() {
        didSet {
            bar.backgroundColor = barColor
        }
    }
    
    
    @IBInspectable var barBgColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            layer.backgroundColor = barBgColor.CGColor
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
    }
    
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialSetup()
    }
    
    
    private func initialSetup() -> Void {
        bar.backgroundColor = self.barColor
        addSubview(bar)
        
        textLabel.textAlignment = .Center
        textLabel.numberOfLines = 0
        textLabel.textColor = self.color
        textLabel.text = "\(self.percent)%"
        addSubview(textLabel)
    }
    
   
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.backgroundColor = self.barBgColor.CGColor
        
        var barFrame = bounds
        barFrame.size.width *= (CGFloat(self.percent) / 100)
        bar.frame = barFrame
        
        textLabel.frame = bounds
    }
}
