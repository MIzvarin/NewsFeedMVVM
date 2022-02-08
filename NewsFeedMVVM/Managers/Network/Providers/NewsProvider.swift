//
//  NewsProvider.swift
//  NewsFeedMVVM
//
//  Created by Максим Изварин on 07.02.2022.
//

import Alamofire

struct NewsProvider: URLRequestBuilder {
    var path = "top-headlines"
    
    var parameters: Parameters? = [ParametersKeys.apiKey.rawValue: "628f1b2a1ec745c4ac7e8910e8e2ea06",
                                   ParametersKeys.language.rawValue: "en",
                                   ParametersKeys.category.rawValue: "technology"]
}


enum ParametersKeys: String {
    case apiKey
    case language
    case country
    case category
    case pageSize
    case page
}
