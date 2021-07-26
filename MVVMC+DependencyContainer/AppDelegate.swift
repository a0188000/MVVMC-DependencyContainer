//
//  AppDelegate.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinstor = AppCoordinator()
    var loginService = LoginService()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        DependencyContainer.register(loginService)
//        DependencyContainer.register(authService)
        // Register Services
        Container.regisgter { LoginService() }
        appCoordinstor.start()
        return true
    }
}
