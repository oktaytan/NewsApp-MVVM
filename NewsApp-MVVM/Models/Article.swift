//
//  Article.swift
//  NewsApp-MVVM
//
//  Created by Oktay Tanrıkulu on 25.11.2020.
//

import Foundation

struct Article: Decodable {
    let title: String
    let description: String
}

struct ArticleList: Decodable {
    let articles: [Article]
}
