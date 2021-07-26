//
//  BaseService.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/26.
//

import UIKit
import Alamofire

protocol Service {
    func requeset<T: Codable>(endPoint: URLRequestConvertible, complectionHandler: @escaping (Swift.Result<T, Error>) -> Void)
}

extension Service {
    func requeset<T: Codable>(endPoint: URLRequestConvertible, complectionHandler: @escaping (Swift.Result<T, Error>) -> Void) {
        Alamofire
            .request(endPoint)
            .responseJSON { (response) in
                guard let data = response.data else {
                    complectionHandler(.failure(response.result.error!))
                    return
                }
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    complectionHandler(.success(response))
                } catch {
                    // decoder失敗，另做處理
                }
            }
    }
}
