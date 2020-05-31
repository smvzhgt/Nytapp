//
//  FavoritePresenter.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class FavoritePresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: FavoriteViewProtocol!
    
}


// MARK: - Extension
extension FavoritePresenter: FavoritePresenterProtocol {
    func presentFetchFavorites(response: Favorite.Fetch.Response) {
        switch response.result {
        case .success(let models):
            let viewModel = Favorite.Fetch.ViewModel(models: models, error: nil)
            self.view.displayFetchFavorites(viewModel: viewModel)
        case .failure(let error):
            let viewModel = Favorite.Fetch.ViewModel(models: [], error: error)
            view.displayFetchFavorites(viewModel: viewModel)
        }
    }
    
}
