//
//  HomeModel.swift
//  LQLRequset
//
//  Created by hou on 2018/4/11.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper

class HomeModel: Mappable {
    var code:Int?
    var msg:String?
    var url:String?
    var data:DataModel?
    
    required init?(map: Map){
        
    }
     func mapping(map: Map) {
        code <- map["code"]
        msg <- map["msg"]
        url <- map["url"]
        data <- map["data"]
        
    }
}
class DataModel: Mappable {
    var headLineList:[HeadModel]?
    var noticeLive:NoticeLiveModel?
    var timestamp:String?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        headLineList <- map["headLineList"]
        noticeLive <- map["noticeLive"]
        timestamp <- map["timestamp"]
        
    }
}

class HeadModel: Mappable {
    var anchorId: Int?
    var anchorPicUrl: String?
    var createTime: String?
    var headLineContent: String?
    var headLineTitle: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        anchorId <- map["anchorId"]
        anchorPicUrl <- map["anchorPicUrl"]
        createTime <- map["createTime"]
        headLineContent <- map["headLineContent"]
        headLineTitle <- map["headLineTitle"]
    }
}

class NoticeLiveModel: Mappable {
    var anchorId: Int?
    var anchorName: String?
    var anchorPicUrl: String?
    var appId: Int?
    var liveNoticeMsg: String?
    var liveTitle: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        anchorId <- map["anchorId"]
        anchorPicUrl <- map["anchorPicUrl"]
        anchorName <- map["anchorName"]
        appId <- map["appId"]
        liveNoticeMsg <- map["liveNoticeMsg"]
        liveTitle <- map["liveTitle"]
    }
}
