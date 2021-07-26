//
//  LoginViewModel.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import Foundation

class LoginViewModel {
    
//    @Dependency
//    var service: LoginService
    @Inject
    var service: LoginService
    
    func login(acc: String, pwd: String) {
        service.login(acc: acc, pwd: pwd, completionHandler: { result in
            
        })
    }
    
    func checkAuthCode(_ code: String) {
        service.checkAuthCode(code, completionHandler: { result in
            
        })
    }
}
