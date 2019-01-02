//
//  AFTool.swift
//  MOA_Swift
//
//  Created by 万浩 on 2018/10/29.
//  Copyright © 2018 万浩. All rights reserved.
//

import UIKit
import Foundation

import Alamofire

public  typealias successBlock = (_ sende:Any)->Void
public  typealias failureBlock = (_ error:String)->Void

class AFTool {
    
    private static let alaSessonManage: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    static func downLoadWithUrl(url:String, parm:[String : Any]?, success:successBlock, failure:failureBlock){
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        alaSessonManage.download(url, to: destination)
        .downloadProgress { (Progress) in
            print(Progress)
        }
        .responseData {(respon) in

        }
        
    }
}





