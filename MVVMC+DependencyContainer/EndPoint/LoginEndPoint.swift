//
//  LoginEndPoint.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/26.
//

import UIKit
import Alamofire

enum LoginEndPoint: EndPoint {
    
    case login(acc: String, pwd: String)
    case verification(authCode: String)
    
    var host: String { "" }
    
    var path: String { "" }
    
    var method: HTTPMethod { .get }
    
    var parameters: Parameters {
        switch self {
        case .login(let acc, let pwd):
            return ["\(acc)": acc,
                    "\(pwd)": pwd]
        case .verification(let authCode):
            return ["\(authCode)": authCode]
        }
    }

    func asURLRequest() throws -> URLRequest {
        try URLEncoding.default.encode(URLRequest(url: "\(host)\(path)", method: method), with: parameters)
    }
}
