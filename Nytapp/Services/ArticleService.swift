//
//  ArticleService.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation
import CoreData

protocol ArticleServiceProtocol {
    func fetchMostEmailedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void)
    func fetchMostSharedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void)
    func fetchMostViewedArticle(days: Int, completion: @escaping (Result<[ArticleModel], CommonError>) -> Void)
    func saveArticleEntity(article: ArticleModel, completion: @escaping (Result<Void, CommonError>) -> Void)
    func fetchArticleEntities(completion: @escaping (Result<[ArticlePresentationModel], CommonError>) -> Void)
    
}

final class ArticleService {
    
    // MARK: - Private Properties
    private let executor: RequestExecutorProtocol
    private let coreDataStack: CoreDataStack
    
    // MARK: - Initializers
    init(executor: RequestExecutorProtocol = RequestExecutor(),
         coreDataStack: CoreDataStack = CoreDataStack.shared) {
        self.executor = executor
        self.coreDataStack = coreDataStack
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
    
    func saveArticleEntity(article: ArticleModel, completion: @escaping (Result<Void, CommonError>) -> Void) {
        let fetchRequest: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", "\(article.id)")
        fetchRequest.predicate = predicate
        
        var entities: [ArticleEntity] = []
        do {
            entities = try coreDataStack.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            completion(.failure(CommonError.invalidDbResult))
        }
        
        guard entities.first == nil else {
            return completion(.success(()))
        }
        
        let entity = ArticleEntity(context: CoreDataStack.shared.persistentContainer.viewContext)
        entity.id = "\(article.id)"
        entity.url = article.url
        entity.title = article.title
        entity.abstract = article.abstract
        entity.imageUrl = article.media.first?.mediaMetadata.filter({ $0.format == "mediumThreeByTwo210" }).first?.url
        coreDataStack.saveContext()
        completion(.success(()))
    }
    
    func fetchArticleEntities(completion: @escaping (Result<[ArticlePresentationModel], CommonError>) -> Void) {
        let fetchRequest: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        var entities: [ArticleEntity]
        do {
            entities = try coreDataStack.persistentContainer.viewContext.fetch(fetchRequest)
            let articles = entities.map({ entity in
                return ArticlePresentationModel(entity: entity)
            })
            completion(.success(articles))
        } catch {
            completion(.failure(CommonError.invalidDbResult))
        }
    }
    
}
