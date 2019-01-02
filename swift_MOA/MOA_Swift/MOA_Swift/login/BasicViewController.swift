//
//  BasicViewController.swift
//  MOA_Swift
//
//  Created by 万浩 on 2018/10/19.
//  Copyright © 2018 万浩. All rights reserved.
//

import UIKit

class BasicViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let vc1 = UnderlyingViewController()
        let navi1 = HZViewController.init(rootViewController: UnderlyingViewController());
        navi1.tabBarItem.title = "1"
        
        let navi2 = HZViewController.init(rootViewController: UnderlyingViewController());
        navi2.tabBarItem.title = "2"
        let navi3 = HZViewController.init(rootViewController: UnderlyingViewController());
        navi3.tabBarItem.title = "3"
        let navi4 = HZViewController.init(rootViewController: UnderlyingViewController());
        navi4.tabBarItem.title = "4"
        self.viewControllers = [navi1, navi2, navi3, navi4];
    }
}
