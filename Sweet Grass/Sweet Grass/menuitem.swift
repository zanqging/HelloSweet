//
//  menuitem.swift
//  Sweet Grass
//
//  Created by HanFang on 4/6/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import Foundation

class type{
    var title = "title"
    var imageName = "blank"
    
    init(title:String,imageName:String){
        self.title = title
        self.imageName = imageName
    }
}

class dish{
    var dishname : String
    var dishimageName : String
    var dishinfo : String
    var dishprice: String
    var dishca: String

//    btn(){
//        _cart.add(self.dishname)
//    }
    
    
    init(title:String,imageName:String,dishinfo:String, dishprice:String, dishca:String){
        self.dishname = title
        self.dishimageName = imageName
        self.dishinfo = dishinfo
        self.dishprice = dishprice
        self.dishca = dishca
    }
}

class cart{
    var name: String
    var price: String
    
    init(name:String, price:String){
        self.name = name
        self.price = price
    }
}