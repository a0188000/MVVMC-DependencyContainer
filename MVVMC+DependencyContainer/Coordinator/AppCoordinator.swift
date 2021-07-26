//
//  AppCoordinator.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    
    var window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    func start() {
        showLoginWindow()
    }
    
    private func showLoginWindow() {
        let navigationController = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)

        self.start(coordinator: loginCoordinator)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func showMainTabbarWindow() {
        
    }
    
}

