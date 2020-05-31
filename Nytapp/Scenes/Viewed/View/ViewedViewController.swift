//
//  ViewedViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class ViewedViewController: UIViewController {
    
    // MARK: - Public Properties
    var interactor: ViewedInteractorProtocol!
    var delegate: ViewedTableViewDelegate!
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchUsers()
        configureTableView()
    }
    
    
    // MARK: - Private Functions
    private func configureTableView() {
        tableView.register(UINib(nibName: ViewedCell.cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: ViewedCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    private func fetchUsers() {
        let request = Viewed.Fetch.Request(days: 1)
        interactor.fetchArticles(request: request)
    }
    
}


// MARK: - Extensions
extension ViewedViewController: ViewedViewProtocol {
    func displayFetchArticles(viewModel: Viewed.Fetch.ViewModel) {
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            delegate.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
    
    func displaySaveArticleToDb(viewModel: Viewed.Save.ViewModel) {
        
    }
}

extension ViewedViewController: ViewedInteractionProtocol {
    func openArticle(link: String) {
        guard let url = URL(string: link) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func addToFavorite(model: ArticleModel) {
        let request = Viewed.Save.Request(article: model)
        interactor.saveArticleToDb(request: request)
    }
    
}
