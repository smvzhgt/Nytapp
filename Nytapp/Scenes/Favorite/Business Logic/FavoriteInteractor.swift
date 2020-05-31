//
//  FavoriteInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class FavoriteInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: FavoritePresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: ArticleServiceProtocol
    
    
    // MARK: - Initializers
    init(presenter: FavoritePresenterProtocol,
         service: ArticleServiceProtocol = ArticleService()) {
        self.presenter = presenter
        self.service = service

        super.init()
    }
    
}


// MARK: - Extension
extension FavoriteInteractor: FavoriteInteractorProtocol {
    func fetchFavorites(request: Favorite.Fetch.Request) {
        service.fetchArticleEntities { [weak self] (result: Result<[ArticlePresentationModel], CommonError>) in
            guard let `self` = self else { return }
            let response = Favorite.Fetch.Response(result: result)
            self.presenter.presentFetchFavorites(response: response)
        }
    }
    
}
