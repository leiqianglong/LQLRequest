//
//  ViewController.swift
//  LGRequest
//
//  Created by hou on 2018/4/14.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        NetManager.shared.getHomeData(timeStr: "0", page: "10", sucessBlock: { (response) in
            
            let model = response as? HomeModel
            
            print(model?.code ?? 0)
            print(model?.msg ?? "")
            print(model?.data?.noticeLive?.liveTitle ?? "")
            
            
        }) { (error) in
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

