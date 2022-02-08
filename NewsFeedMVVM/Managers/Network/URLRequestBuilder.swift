//
//  URLRequestBuilder.swift
//  NewsFeedMVVM
//
//  Created by Максим Изварин on 07.02.2022.
//

import Alamofire

//MARK: - URL Request builder

///@mockable
protocol URLRequestBuilder: URLConvertible {
    var baseURL: String { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var httpMethod: HTTPMethod { get }
}

extension URLRequestBuilder {
    var baseURL: String {
        "https://newsapi.org/v2"
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    func asURL() throws -> URL {
        let baseUrl = try baseURL.asURL()
        var request = URLRequest(url: baseUrl.appendingPathComponent(path))
        request.method = httpMethod
        request = try  URLEncoding.default.encode(request, with: parameters)
        guard let url = request.url else { throw AFError.createURLRequestFailed(error: RequestBuildingError.createURLRequestFailed) }
        return url
    }
}

enum RequestBuildingError: Error {
    case createURLRequestFailed
}
