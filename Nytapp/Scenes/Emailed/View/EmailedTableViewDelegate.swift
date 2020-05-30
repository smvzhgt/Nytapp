//
//  EmailedTableViewDelegate.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import UIKit

final class EmailedTableViewDelegate: NSObject {
    
    // MARK: - Public Properties
    var dataSource: [ArticlePresentationModel]
    
    
    // MARK: - Private Properties
    private var userInteraction: EmailedInteractionProtocol
    
    
    // MARK: - Initializers
    init(userInteraction: EmailedInteractionProtocol,
         presentationModels: [ArticlePresentationModel] = []) {
        self.dataSource = presentationModels
        self.userInteraction = userInteraction
    }
    
}


// MARK: - UITableView Data Source
extension EmailedTableViewDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let model = dataSource[row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.cellIdentifier) as? ArticleCell {
            cell.fill(model: model)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}


// MARK: - UITableView Delegate
extension EmailedTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ArticleCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        userInteraction.openArticle(link: model.url)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
}

