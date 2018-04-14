//
//  NetManager.swift
//  LQLRequset
//
//  Created by hou on 2018/4/13.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire


class NetManager: NSObject {
    /**
     创建网络请求工具类单利
     */
    static let shared : NetManager = {
        let share = NetManager()
        return share
    }()

    
    /**
     请求成功回调
     */
    typealias SucessBlock = ( _ request : Any) -> Void

    /**
     请求失败回调
     */
    typealias FailureBlock = (_ error : NSError) -> Void
    
   /**
     🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟《以下是网络请求》🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟
     */
    
    /**
     MARK ********************************************** 首页模块所有接口  **********************************************
     */
    
    //首页列表接口
    func getHomeData(timeStr:String,page:String,
                     sucessBlock: @escaping SucessBlock,
                     failedBlock: @escaping FailureBlock){
        
        let url = "api/headLine/getHeadLineListByDeptId"
        let dic = ["userId":"149",
                   "page":"1",
                   "limit":"10",
                   "timestamp":"0"]
        NetTools.request(url: url, methed: .netGet, dic: dic, responseBlock: { (request) in
            request.responseObject(completionHandler: { (res:DataResponse<HomeModel>) in
                let mode = res.result.value
                sucessBlock(mode ?? nil!)
            })
        }) { (error) in
            failedBlock(error)
        }
    }
    
    
    /**
     MARK ********************************************** 商城模块所有接口 **********************************************
     */

    
    /**
     MARK ********************************************** 我的模块所有接口 **********************************************
     */

    
    
}











