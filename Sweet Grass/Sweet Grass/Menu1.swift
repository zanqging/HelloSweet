//
//  Menu1.swift
//  Sweet Grass
//
//  Created by HanFang on 4/6/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit

class Menu1: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(name:String,imageName:String)
    {
        self.title.text = name
        self.myImageView.image = UIImage(named: imageName)
    }

}
