//
//  EndPoint.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/26.
//

import UIKit
import Alamofire

protocol EndPoint: URLRequestConvertible {
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
}
