//
//  NetRequest.swift
//  LQLRequset
//
//  Created by hou on 2018/4/11.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SVProgressHUD

class NetRequest: NSObject {
    /**
     请求接口名字
     */
    var requestName : String = ""
    /**
     请求路径
     */
    var requestPath :String = ""
    /**
     请求参数
     */
    var params:Dictionary<String,Any>? = [:]
    /**
     是否需要加载动画
     */
    var isLoding : Bool = true
    /**
     请求方式
     */
    var methed:HTTPMethod?

    /**
      请求成功回调
     */
    typealias ResponseBlock = (_ request : DataRequest) -> Void
    /**
     请求失败回调
     */
    typealias FailureBlock = (_ error : NSError) -> Void
    
    func startRequest(responseBlock: @escaping ResponseBlock,failedBlock: @escaping FailureBlock) {
        //请求配置
        let url = HTTPBASEURL + requestPath
        let header : HTTPHeaders = ["Authorization":TOKEN]

        //添加加载动画
        if isLoding {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
            SVProgressHUD.setDefaultAnimationType(.native)
            SVProgressHUD.show(withStatus: "加载中...")
        }
 
        let req = Alamofire.request(url, method:methed ?? .post, parameters: params, encoding: URLEncoding.default, headers: header)

        req.responseObject {(res:DataResponse<NetBaseModel>)  in
            //隐藏菊花
            SVProgressHUD.dismiss()
            //已转换的模型
            let model = res.result.value
            if res.result.isSuccess {
                self.requestSucessBlock(model: model, request: req, responseBlock: responseBlock, failedBlock: failedBlock)
            }else{ //网络请求失败
                 let error = res.error! as NSError
                self.processFailureBlock(error: error, failedBlock: failedBlock)
            }
        }
    }
    
    func requestSucessBlock(model:NetBaseModel?,request:DataRequest,responseBlock: @escaping ResponseBlock,failedBlock: @escaping FailureBlock) {
        if model?.code != nil {
            if model?.code == Request_Sucess {
                //请求成功
                responseBlock(request)
            }else{
                //请求失败
                let error:NSError = NSError(domain: (model?.msg) ?? "未知错误", code: (model?.code) ?? 1024, userInfo: nil)
                failedBlock(error)
            }
        }else{
            //code 为nil 接口错误
            SVProgressHUD.showError(withStatus: "服务器返回code码错误")
        }
    }
    func processFailureBlock(error:NSError,failedBlock: @escaping FailureBlock) {

        if error.code == -1004 {
            SVProgressHUD.showError(withStatus: "未能连接到服务器")
        }else if error.code == -1001 {
            SVProgressHUD.showError(withStatus: "网络连接超时，请稍后再试！")
        }else if error.code == -1022 {
             SVProgressHUD.showError(withStatus: "IOS9安全限制")
        }else if error.code == -1009 {
             SVProgressHUD.showError(withStatus: "无网络连接")
        }else {
             SVProgressHUD.showError(withStatus: "网络请求失败")
        }
        failedBlock(error)
    }
    
}

