//
//  SharedProtocols.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol SharedInteractorProtocol: class {
    func fetchArticles(request: Shared.Fetch.Request)
    func saveArticleToDb(request: Shared.Save.Request)
}

// MARK: - Presentation Protocol
protocol SharedPresenterProtocol: class {
    func presentFetchArticles(response: Shared.Fetch.Response)
    func presentSaveArticleToDb(response: Shared.Save.Response)
}


// MARK: - View Protocol
protocol SharedViewProtocol: class {
    func displayFetchArticles(viewModel: Shared.Fetch.ViewModel)
    func displaySaveArticleToDb(viewModel: Shared.Save.ViewModel)
}


// MARK: - TableViewProtocol
protocol SharedInteractionProtocol: class {
    func openArticle(link: String)
    func addToFavorite(model: ArticleModel)
}
