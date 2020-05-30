//
//  ArticleService.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation

protocol ArticleServiceProtocol {
    func fetchMostEmailedArticle(days: Int, completion: @escaping (Result<[MostEmailedArticleModel], CommonError>) -> Void)
    func fetchMostSharedArticle(days: Int, completion: @escaping (Result<[MostEmailedArticleModel], CommonError>) -> Void)
    func fetchMostViewedArticle(days: Int, completion: @escaping (Result<[MostEmailedArticleModel], CommonError>) -> Void)
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
    func fetchMostEmailedArticle(days: Int, completion: @escaping (Result<[MostEmailedArticleModel], CommonError>) -> Void) {
        let request = MostEmailedArticleRequest(days: days).getDataRequest()
        executor.executeObject(dataRequest: request, entity: MostEmailedArticleResponseModel.self) { (model, error) in
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
    
    func fetchMostSharedArticle(days: Int, completion: @escaping (Result<[MostEmailedArticleModel], CommonError>) -> Void) {
        let request = MostSharedArticleRequest(days: days).getDataRequest()
        executor.executeObject(dataRequest: request, entity: MostEmailedArticleResponseModel.self) { (model, error) in
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
    
    func fetchMostViewedArticle(days: Int, completion: @escaping (Result<[MostEmailedArticleModel], CommonError>) -> Void) {
        let request = MostViewedArticlesRequest(days: days).getDataRequest()
        executor.executeObject(dataRequest: request, entity: MostEmailedArticleResponseModel.self) { (model, error) in
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
