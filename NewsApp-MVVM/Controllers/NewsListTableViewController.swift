//
//  NewsListTableViewController.swift
//  NewsApp-MVVM
//
//  Created by Oktay Tanrıkulu on 25.11.2020.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    var cellID = "ArticleListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey={YOUR_API_KEY}") {
         
            WebService().getArticles(url: url) { articles in
                if let articles = articles {
                    self.articleListVM = ArticleListViewModel(for: articles)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            
        }
    }
    
}

// MARK: - TableViewController Methods

extension NewsListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found!")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(at: indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        cell.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return cell
    }
    
}
