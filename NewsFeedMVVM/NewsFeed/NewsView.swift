//
//  NewsFeedView.swift
//  NewsFeedMVVM
//
//  Created by Максим Изварин on 07.02.2022.
//

import Combine
import SwiftUI

struct NewsView: View {
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                Text(article.title)
            }.navigationTitle("News")
                .onAppear(perform: viewModel.loadArticles)
                .listStyle(.inset)
        }.navigationViewStyle(.stack)
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NewsViewModel()
        NewsView(viewModel: viewModel)
            .previewDevice("iPhone 13 Pro")
    }
}
