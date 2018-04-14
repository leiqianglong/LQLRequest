//
//  NetTools.swift
//  LQLRequset
//
//  Created by hou on 2018/4/11.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import Alamofire

class NetTools: NSObject {

    enum NetMethod{
        case netPost
        case netGet
        case netPut
        case netDelete
    }
    /**
     请求成功回调
     */
    typealias ReponseBlock = (_ request : DataRequest) -> Void
    /**
     请求失败回调
     */
    typealias FailureBlock = (_ error : NSError) -> Void
    /**
      请求方法
     */
   class func request(url:String,
                 methed:NetMethod? = .netPost,
                 dic:Dictionary<String,String>?,
                 isShowLoding:Bool? = true,
                 name:String? = "",
                 responseBlock: @escaping ReponseBlock,
                 failedBlock: @escaping FailureBlock) {

        let request = getData(name: name!, path: url, parameters: dic, methed: methed!,isShowLoding: isShowLoding!)
        request.startRequest(responseBlock: { (request) in
             responseBlock(request)
        }) { (error) in
            failedBlock(error)
        }
    }
    
    /**
     初始化 resquest
     */
   class func getData(name:String,path:String,
                 parameters:Dictionary<String, String>?,
                 methed:NetMethod,
                 isShowLoding:Bool? = true) -> NetRequest {
  
        let request = NetRequest()
        request.requestName = name
        request.requestPath = path
        request.params = parameters
        request.isLoding = isShowLoding!

        switch methed {
            case .netPost:
             request.methed = .post
            break
            case .netGet:
             request.methed = .get
            break
            case .netPut:
             request.methed = .put
            break
            case .netDelete:
             request.methed = .delete
            break
        }
        return request
    }

}
