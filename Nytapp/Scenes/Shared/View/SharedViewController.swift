//
//  SharedViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class SharedViewController: BaseViewController {
    
    // MARK: - Public Properties
    var interactor: SharedInteractorProtocol!
    var delegate: SharedTableViewDelegate!
    
    
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
        tableView.register(UINib(nibName: SharedCell.cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: SharedCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    private func fetchUsers() {
        showLoading()
        let request = Shared.Fetch.Request(days: 30)
        interactor.fetchArticles(request: request)
    }
    
}


// MARK: - Extensions
extension SharedViewController: SharedViewProtocol {
    func displayFetchArticles(viewModel: Shared.Fetch.ViewModel) {
        hideLoading()
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            delegate.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
    
    func displaySaveArticleToDb(viewModel: Shared.Save.ViewModel) {
        
    }
}

extension SharedViewController: SharedInteractionProtocol {
    func openArticle(link: String) {
        guard let url = URL(string: link) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func addToFavorite(model: ArticleModel) {
        let request = Shared.Save.Request(article: model)
        interactor.saveArticleToDb(request: request)
    }
    
}
