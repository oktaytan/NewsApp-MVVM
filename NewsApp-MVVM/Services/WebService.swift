//
//  WebService.swift
//  NewsApp-MVVM
//
//  Created by Oktay Tanrıkulu on 25.11.2020.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            guard let data = data, let articleList = try? JSONDecoder().decode(ArticleList.self, from: data) else {
                completion(nil)
                return
            }
            
            completion(articleList.articles)
            
        }.resume()
        
    }
    
}
