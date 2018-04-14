//
//  NetBaseModel.swift
//  LQLRequset
//
//  Created by hou on 2018/4/11.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper




class NetBaseModel: Mappable {
    var code:Int?
    var msg:String?
    required init?(map: Map){
    
    }
     func mapping(map: Map) {
        code <- map["code"]
        msg <- map["msg"]
    }
}

