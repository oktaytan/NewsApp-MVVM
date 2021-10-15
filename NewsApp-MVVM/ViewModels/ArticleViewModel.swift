//
//  ArticleViewModel.swift
//  NewsApp-MVVM
//
//  Created by Oktay Tanrıkulu on 25.11.2020.
//

import Foundation


struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    init(for articles: [Article]) {
        self.articles = articles
    }
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(at index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}
