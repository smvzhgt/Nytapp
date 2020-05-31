//
//  ViewedProtocols.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol ViewedInteractorProtocol: class {
    func fetchArticles(request: Viewed.Fetch.Request)
    func saveArticleToDb(request: Viewed.Save.Request)
}

// MARK: - Presentation Protocol
protocol ViewedPresenterProtocol: class {
    func presentFetchArticles(response: Viewed.Fetch.Response)
    func presentSaveArticleToDb(response: Viewed.Save.Response)
}


// MARK: - View Protocol
protocol ViewedViewProtocol: class {
    func displayFetchArticles(viewModel: Viewed.Fetch.ViewModel)
    func displaySaveArticleToDb(viewModel: Viewed.Save.ViewModel)
}


// MARK: - TableViewProtocol
protocol ViewedInteractionProtocol: class {
    func openArticle(link: String)
    func addToFavorite(model: ArticleModel)
}
