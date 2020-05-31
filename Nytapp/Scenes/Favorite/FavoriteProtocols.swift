//
//  FavoriteProtocols.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol FavoriteInteractorProtocol: class {
    func fetchFavorites(request: Favorite.Fetch.Request)
}

// MARK: - Presentation Protocol
protocol FavoritePresenterProtocol: class {
    func presentFetchFavorites(response: Favorite.Fetch.Response)
}


// MARK: - View Protocol
protocol FavoriteViewProtocol: class {
    func displayFetchFavorites(viewModel: Favorite.Fetch.ViewModel)
}


// MARK: - TableViewProtocol
protocol FavoriteInteractionProtocol: class {
    func openArticle(link: String)
}
