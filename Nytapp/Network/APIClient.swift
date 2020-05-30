//
//  APIClient.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    func fetchMostEmailedArticle(days: Int, completion: @escaping (Result<MostEmailedArticleResponseModel, CommonError>) -> Void)
}


final class APIClient {
    
    // MARK: - Private Properties
    private let executor: RequestExecutorProtocol
    
    
    // MARK: - Initializers
    init(executor: RequestExecutorProtocol = RequestExecutor()) {
        self.executor = executor
    }
    
}


// MARK: - Extension
extension APIClient: APIClientProtocol {
    func fetchMostEmailedArticle(days: Int, completion: @escaping (Result<MostEmailedArticleResponseModel, CommonError>) -> Void) {
        let request = MostEmailedRequest(days: days).getDataRequest()
        executor.executeObject(dataRequest: request, entity: MostEmailedArticleResponseModel.self) { (model, error) in
            switch (model, error) {
            case let (.some(model), .none):
                completion(.success(model))
            case let (.none, .some(error)):
                completion(.failure(error))
            case (.none, .none), (.some(_), .some(_)):
                completion(.failure(CommonError.invalidData))
            }
        }
    }
    
}
