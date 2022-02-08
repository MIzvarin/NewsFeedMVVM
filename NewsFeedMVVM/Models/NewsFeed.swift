//
//  NewsFeed.swift
//  NewsFeedMVVM
//
//  Created by Максим Изварин on 07.02.2022.
//

import Foundation

// MARK: - NewsFeed
struct NewsFeed: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
