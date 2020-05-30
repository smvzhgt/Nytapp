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
//    var isLoading: Bool = false
    
    
    // MARK: - Private Properties
    private var interactionProtocol: EmailedInteractionProtocol
    
    
    
    // MARK: - Initializers
    init(interactionProtocol: EmailedInteractionProtocol, presentationModels: [ArticlePresentationModel] = []) {
        self.dataSource = presentationModels
        self.interactionProtocol = interactionProtocol
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

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
}

