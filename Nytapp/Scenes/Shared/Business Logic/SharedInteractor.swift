//
//  SharedInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class SharedInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: SharedPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: ArticleServiceProtocol
    
    
    // MARK: - Initializers
    init(presenter: SharedPresenterProtocol,
         service: ArticleServiceProtocol = ArticleService()) {
        self.presenter = presenter
        self.service = service

        super.init()
    }
    
}


// MARK: - Extension
extension SharedInteractor: SharedInteractorProtocol {
    func fetchArticles(request: Shared.Fetch.Request) {
        service.fetchMostSharedArticle(days: request.days) { [weak self] (result: Result<[ArticleModel], CommonError>) in
            guard let `self` = self else { return }
            let response = Shared.Fetch.Response(result: result)
            self.presenter.presentFetchArticles(response: response)
        }
    }
    
    func saveArticleToDb(request: Shared.Save.Request) {
        service.saveArticleEntity(article: request.article) { [weak self] (result: Result<Void, CommonError>) in
            guard let `self` = self else { return }
            let response = Shared.Save.Response(result: result)
            self.presenter.presentSaveArticleToDb(response: response)
        }
    }
    
}
