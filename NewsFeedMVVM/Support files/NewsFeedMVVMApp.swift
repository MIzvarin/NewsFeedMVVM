//
//  NewsFeedMVVMApp.swift
//  NewsFeedMVVM
//
//  Created by Максим Изварин on 07.02.2022.
//

import SwiftUI

@main
struct NewsFeedMVVMApp: App {
    let viewModel = NewsViewModel()
    
    var body: some Scene {
        WindowGroup {
            NewsView(viewModel: viewModel)
        }
    }
}
