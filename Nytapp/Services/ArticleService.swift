//
//  ArticleService.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation

protocol ArticleServiceProtocol {
    func fetchMostEmailedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void)
    func fetchMostSharedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void)
    func fetchMostViewedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void)
}

final class ArticleService {
    
    // MARK: - Private Properties
    private let executor: RequestExecutorProtocol
    
    
    // MARK: - Initializers
    init(executor: RequestExecutorProtocol = RequestExecutor()) {
        self.executor = executor
    }
    
}


// MARK: - Extension
extension ArticleService: ArticleServiceProtocol {
    func fetchMostEmailedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void) {
        let url = MostEmailedArticleUrl(days: days).build()
        let request = ArticlesRequest(url: url).getDataRequest()
        executor.executeObject(dataRequest: request, entity: ArticleResponseModel.self) { (model, error) in
            switch (model, error) {
            case let (.some(model), .none):
                completion(.success(model.results))
            case let (.none, .some(error)):
                completion(.failure(error))
            case (.none, .none), (.some(_), .some(_)):
                completion(.failure(CommonError.invalidData))
            }
        }
    }
    
    func fetchMostSharedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void) {
        let url = MostSharedArticleUrl(days: days).build()
        let request = ArticlesRequest(url: url).getDataRequest()
        executor.executeObject(dataRequest: request, entity: ArticleResponseModel.self) { (model, error) in
            switch (model, error) {
            case let (.some(model), .none):
                completion(.success(model.results))
            case let (.none, .some(error)):
                completion(.failure(error))
            case (.none, .none), (.some(_), .some(_)):
                completion(.failure(CommonError.invalidData))
            }
        }
    }
    
    func fetchMostViewedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void) {
        let url = MostViewedArticleUrl(days: days).build()
        let request = ArticlesRequest(url: url).getDataRequest()
        executor.executeObject(dataRequest: request, entity: ArticleResponseModel.self) { (model, error) in
            switch (model, error) {
            case let (.some(model), .none):
                completion(.success(model.results))
            case let (.none, .some(error)):
                completion(.failure(error))
            case (.none, .none), (.some(_), .some(_)):
                completion(.failure(CommonError.invalidData))
            }
        }
    }
    
}
