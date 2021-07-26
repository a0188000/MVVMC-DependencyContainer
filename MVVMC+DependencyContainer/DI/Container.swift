//
//  Container.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/26.
//

import Foundation

class Container {
    private static var shared = Container()
    private init() { }
    
    var factoryDict = [String: () -> Any]()
    
    static func regisgter<Service>(_ factory: @escaping () -> Service) {
        shared.regisgter(factory)
    }
    
    static func reslove<Service>() -> Service {
        shared.reslove()
    }
    
    private func regisgter<Service>(_ factory: @escaping () -> Service) {
        factoryDict["\(type(of: Service.self))"] = factory
    }
    
    private func reslove<Service>() -> Service {
        return factoryDict["\(type(of: Service.self))"]?() as! Service
    }
}

@propertyWrapper
struct Inject<Type> {
    var type: Type
    
    init() {
        self.type = Container.reslove()
    }
    
    var wrappedValue: Type {
        get { self.type }
        mutating set { self.type = newValue }
    }
}
