//
//  Network.swift
//  NewsFeedMVVM
//
//  Created by Максим Изварин on 07.02.2022.
//

import Alamofire

//MARK: - Networkable

///@mockable
protocol Networkable {
    func request<T: URLRequestBuilder, U: Codable>(from: T, decodeTo: U.Type, completionHandler: @escaping (Result<U, AFError>) -> Void)
}

//MARK: - NetworkManager

class NetworkManager: Networkable {
    static let shared = NetworkManager()
    
    func request<T: URLRequestBuilder, U: Codable>(from service: T, decodeTo model: U.Type, completionHandler: @escaping (Result<U, AFError>) -> Void) {
        AF.request(service).responseDecodable(of: U.self) { response in
            completionHandler(response.result)
        }
    }
    
    private init() {}
}
