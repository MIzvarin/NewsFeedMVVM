//
//  NewsFeedViewModel.swift
//  NewsFeedMVVM
//
//  Created by Максим Изварин on 07.02.2022.
//

import Combine
import Foundation

class NewsViewModel: ObservableObject {
    @Published private(set) var articles: [Article] = []
    
    func loadArticles() {
        NetworkManager.shared.request(from: NewsProvider(), decodeTo: NewsFeed.self) { [weak self] result in
            switch result {
            case .success(let news):
                self?.articles = news.articles
            case .failure(let error):
                print(error)
            }
        }
    }
}
