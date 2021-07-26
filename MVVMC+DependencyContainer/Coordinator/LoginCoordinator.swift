//
//  LoginCoordinator.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import UIKit

protocol LoginFlow: class {
    func loginSuccess()
    func verificationSuccess()
}

class LoginCoordinator: Coordinator {
    
    enum Step {
        case login, verification
    }
    
    var navigationController: UINavigationController
    
    var loginViewModel = LoginViewModel()
    
    private var step: Step = .login
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        switch step {
        case .login:
            self.showLoginViewCtrl()
        case .verification:
            self.showVerificationViewCtrl()
        }
        
    }
    
    private func showLoginViewCtrl() {
        let loginViewCtrl = LoginViewController(coordinator: self, viewModel: loginViewModel)
        navigationController.pushViewController(loginViewCtrl, animated: true)
    }
    
    private func showVerificationViewCtrl() {
        let verificationCtrl = VerificationViewController(coordinator: self, viewModel: loginViewModel)
        navigationController.pushViewController(verificationCtrl, animated: true)
    }
}

extension LoginCoordinator: LoginFlow {
    func loginSuccess() {
        step = .verification
        start(coordinator: self)
    }
    
    func verificationSuccess() {
        
    }
}
