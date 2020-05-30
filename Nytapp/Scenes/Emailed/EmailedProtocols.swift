//
//  EmailedProtocols.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

// MARK: - Business Logic Protocol
protocol EmailedInteractorProtocol: class {
    func fetchArticles(request: Emailed.Fetch.Request)
}

// MARK: - Presentation Protocol
protocol EmailedPresenterProtocol: class {
    func presentFetchArticles(response: Emailed.Fetch.Response)
}


// MARK: - View Protocol
protocol EmailedViewProtocol: class {
    func displayFetchArticles(viewModel: Emailed.Fetch.ViewModel)
}


// MARK: - TableViewProtocol
protocol EmailedInteractionProtocol: class {
    func openArticle(link: String)
    func addToFavorite(model: ArticleModel)
}
