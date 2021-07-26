//
//  coordinator.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
    func start(coordinator: Coordinator)
}

extension Coordinator {
    func start(coordinator: Coordinator) {
        coordinator.start()
    }
}
