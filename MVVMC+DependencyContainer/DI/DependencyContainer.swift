//
//  DependencyContainer.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import Foundation

class DependencyContainer {
    
    private var dependecies = [String: Weak]()
//    private init() { }
    private static var shared = DependencyContainer.init()
    
    static func register<T>(_ dependency: T) {
        shared.register(dependency)
    }
    
    static func resolve<T>() -> T {
        return shared.resolve()
    }
    
    private func register<T>(_ dependency: T) {
        let key = "\(type(of: T.self))"
        let weak = Weak.init(value: dependency as AnyObject)
        dependecies[key] = weak
    }
    
    private func resolve<T>() -> T {
        let key = "\(type(of: T.self))"
        let weak = dependecies[key]
        
        precondition(weak != nil , "No Dependency found for - \(key), Applicaition must register a dependency before it.")
        
        let dependency = weak!.value as? T
        
        precondition(dependency != nil, "No Dependency found for - \(key), Dependency is already deallocated by the system.")
        
        return dependency!
    }
}

class Weak: Equatable {
    weak var value: AnyObject?
    init(value: AnyObject) {
        self.value = value
    }
    
    static func == (lhs: Weak, rhs: Weak) -> Bool {
        return lhs === rhs
    }
}

@propertyWrapper
class Dependency<T> {
    
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyContainer.resolve()
    }
}
