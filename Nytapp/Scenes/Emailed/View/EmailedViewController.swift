//
//  EmailedViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class EmailedViewController: UIViewController {
    
    // MARK: - Public Properties
    var interactor: EmailedInteractorProtocol!
    var delegate: EmailedTableViewDelegate!
    
    
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
        tableView.register(UINib(nibName: ArticleCell.cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: ArticleCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    private func fetchUsers() {
        let request = Emailed.Fetch.Request(days: 1)
        interactor.fetchArticles(request: request)
    }
    
}


// MARK: - Extensions
extension EmailedViewController: EmailedViewProtocol {
    func displayFetchArticles(viewModel: Emailed.Fetch.ViewModel) {
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            delegate.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
}

extension EmailedViewController: EmailedInteractionProtocol {
    func openArticle(link: String) {
        guard let url = URL(string: link) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}
