//
//  FavoriteViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class FavoriteViewController: UIViewController {
    
    // MARK: - Public Properties
    var interactor: FavoriteInteractorProtocol!
    var delegate: FavoriteTableViewDelegate!
    
    
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
        tableView.register(UINib(nibName: FavoriteCell.cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: FavoriteCell.cellIdentifier)
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    private func fetchUsers() {
        let request = Favorite.Fetch.Request()
        interactor.fetchFavorites(request: request)
    }
    
}


// MARK: - Extensions
extension FavoriteViewController: FavoriteViewProtocol {
    func displayFetchFavorites(viewModel: Favorite.Fetch.ViewModel) {
        if let error = viewModel.error {
            showWarningDialog(message: error.localizedDescription)
        } else {
            delegate.dataSource = viewModel.models
            tableView.reloadData()
        }
    }
    
}

extension FavoriteViewController: FavoriteInteractionProtocol {
    func openArticle(link: String) {
        guard let url = URL(string: link) else {
            return
        }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

}
