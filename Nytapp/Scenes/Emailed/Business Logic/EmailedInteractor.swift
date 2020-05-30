//
//  EmailedInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class EmailedInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: EmailedPresenterProtocol!
    
    
    // MARK: - Private Properties
    private var service: ArticleServiceProtocol
    
    
    // MARK: - Initializers
    init(presenter: EmailedPresenterProtocol, service: ArticleServiceProtocol = ArticleService()) {
        self.presenter = presenter
        self.service = service

        super.init()
    }
    
}


// MARK: - Extension
extension EmailedInteractor: EmailedInteractorProtocol {
    func fetchArticles(request: Emailed.Fetch.Request) {
        service.fetchMostEmailedArticle(days: request.days) { [weak self] (result: Result<[ArticleModel], CommonError>) in
            guard let `self` = self else { return }
            let response = Emailed.Fetch.Response(result: result)
            self.presenter.presentFetchArticles(response: response)
        }
    }
    
}
