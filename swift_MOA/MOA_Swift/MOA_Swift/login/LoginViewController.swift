//
//  LoginViewController.swift
//  MOA_Swift
//
//  Created by 万浩 on 2018/10/17.
//  Copyright © 2018 万浩. All rights reserved.
//

import UIKit

import SnapKit

public  typealias loginComplete = (String)->Void


protocol loginProtocol {
    func getLoginNmae(name:String)
}

class LoginViewController: UIViewController{
    var loginFrame:CGRect!
    var loginBtn:UIButton!
    
    var loginMake:ConstraintMaker?

    var completeBlock:loginComplete?
    var delegate:loginProtocol?
    
    
    @IBOutlet weak var usernameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubView()
        
        resisterNoti()
    }
    
    func resisterNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDismiss), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK:键盘弹出时获取
    @objc func keyboardWillShow(nofi : Notification) {
        let userInfo:NSDictionary! = nofi.userInfo! as NSDictionary
        let value:NSValue! = userInfo.object(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue
        let keyboardFrmae = value.cgRectValue
        UIView.animate(withDuration: 0.1) {
            self.loginBtn.frame = CGRect.init(x: self.loginFrame.origin.x, y: keyboardFrmae.origin.y - 48, width: self.loginFrame.size.width, height: self.loginFrame.size.height)
            
            self.loginBtn.snp.makeConstraints({(make) in
                make.width.equalTo(self.loginMake?.top as! ConstraintRelatableTarget)
                
            })
        }
        
    }
    
    @objc func keyboardWillDismiss(nofi : Notification) {
        UIView.animate(withDuration: 0.1) {
            self.loginBtn.snp.makeConstraints({ (make) in
                
            })
        }
    }
    
    func setUpSubView() {
        self.loginBtn = UIButton.init(type: .custom)
//        self.loginBtn.snp.makeConstraints { (make) in
//            make.width.equalTo(172)
//            make.height.equalTo(48)
//            make.right.equalTo(16)
//            make.bottom.equalTo(230)
//        }
//        self.loginBtn.frame = CGRect.init(x: self.view.frame.size.width - 172 - 16, y:  self.view.frame.size.height - 230 , width: 172, height: 48)
        self.loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        self.loginBtn.setTitle("登录", for: .normal)
        self.loginBtn.backgroundColor = UIColor.red
        self.loginBtn.layer.cornerRadius = 2
        self.loginBtn.clipsToBounds = true
        self.loginBtn.addTarget(self, action: #selector(complete), for: UIControl.Event.touchUpInside)
        self.loginBtn.setTitleColor(UIColor.white, for: .normal)
        self.loginBtn.isUserInteractionEnabled = true
        self.loginBtn.alpha = 0.5
        self.view.addSubview(self.loginBtn)
        self.loginBtn.snp.makeConstraints { (make) in
            make.width.equalTo(172)
            make.height.equalTo(48)
            make.right.equalTo(-16)
            make.bottom.equalTo(-230)
            loginMake = make
        }
//        self.loginFrame = self.loginBtn.frame
      
    }
    
    @objc func complete(){
        if self.completeBlock != nil {
            self.completeBlock?(self.usernameText.text!)
        }
        
        if self.delegate != nil {
            self.delegate?.getLoginNmae(name: self.usernameText.text!)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


