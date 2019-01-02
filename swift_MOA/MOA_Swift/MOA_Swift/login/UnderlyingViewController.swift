//
//  UnderlyingViewController.swift
//  MOA_Swift
//
//  Created by 万浩 on 2018/10/24.
//  Copyright © 2018 万浩. All rights reserved.
//

import UIKit

class UnderlyingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setUpSubView()
    }
    
    func setUpSubView (){
        
        AFTool.downLoadWithUrl(url: "https://api-emas.hzbank.com.cn/Harmony/downloaddetail/queryallaa", parm: ["1":"2222","2":"44444"], success: { (Any) in
            
        }) { (NSError) in
            
        }
    }
}
