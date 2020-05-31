//
//  ViewedInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class ViewedInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: ViewedPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: ArticleServiceProtocol
    
    
    // MARK: - Initializers
    init(presenter: ViewedPresenterProtocol,
         service: ArticleServiceProtocol = ArticleService()) {
        self.presenter = presenter
        self.service = service

        super.init()
    }
    
}


// MARK: - Extension
extension ViewedInteractor: ViewedInteractorProtocol {
    func fetchArticles(request: Viewed.Fetch.Request) {
        service.fetchMostViewedArticle(days: request.days) { [weak self] (result: Result<[ArticleModel], CommonError>) in
            guard let `self` = self else { return }
            let response = Viewed.Fetch.Response(result: result)
            self.presenter.presentFetchArticles(response: response)
        }
    }
    
    func saveArticleToDb(request: Viewed.Save.Request) {
        service.saveArticleEntity(article: request.article) { [weak self] (result: Result<Void, CommonError>) in
            guard let `self` = self else { return }
            let response = Viewed.Save.Response(result: result)
            self.presenter.presentSaveArticleToDb(response: response)
        }
    }
    
}
