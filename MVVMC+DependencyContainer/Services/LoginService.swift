//
//  LoginService.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import Foundation

class LoginService: Service {
    func login(acc: String, pwd: String, completionHandler: @escaping (Result<String, Error>) -> Void) {
        let endPoint = LoginEndPoint.login(acc: acc, pwd: pwd)
        self.requeset(endPoint: endPoint, complectionHandler: completionHandler)
    }
    
    func checkAuthCode(_ code: String, completionHandler: @escaping (Result<String, Error>) -> Void) {
        let endPoint = LoginEndPoint.verification(authCode: code)
        self.requeset(endPoint: endPoint, complectionHandler: completionHandler)
    }
}
