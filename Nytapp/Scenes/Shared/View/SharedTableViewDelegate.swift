//
//  SharedTableViewDelegate.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import UIKit

final class SharedTableViewDelegate: NSObject {
    
    // MARK: - Public Properties
    var dataSource: [ArticlePresentationModel]
    
    
    // MARK: - Private Properties
    private var userInteraction: SharedInteractionProtocol
    
    
    // MARK: - Initializers
    init(userInteraction: SharedInteractionProtocol,
         presentationModels: [ArticlePresentationModel] = []) {
        self.dataSource = presentationModels
        self.userInteraction = userInteraction
    }
    
}


// MARK: - UITableView Data Source
extension SharedTableViewDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let model = dataSource[row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: SharedCell.cellIdentifier) as? SharedCell {
            cell.fill(model: model)
            cell.delegate = userInteraction
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
extension SharedTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SharedCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        userInteraction.openArticle(link: model.url)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
}

