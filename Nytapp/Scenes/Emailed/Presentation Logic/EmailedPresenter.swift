//
//  EmailedPresenter.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class EmailedPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: EmailedViewProtocol!
    
}


// MARK: - Extension
extension EmailedPresenter: EmailedPresenterProtocol {
    func presentFetchArticles(response: Emailed.Fetch.Response) {
        switch response.result {
        case .success(let models):
            DispatchQueue.global(qos: .userInitiated).async {
                let presentationModels = models.map({
                    return ArticlePresentationModel(model: $0)
                })
                DispatchQueue.main.async { [weak self] in
                    let viewModel = Emailed.Fetch.ViewModel(models: presentationModels, error: nil)
                    self?.view.displayFetchArticles(viewModel: viewModel)
                }
            }
        case .failure(let error):
            let viewModel = Emailed.Fetch.ViewModel(models: [], error: error)
            view.displayFetchArticles(viewModel: viewModel)
        }
    }
    
    func presentSaveArticleToDb(response: Emailed.Save.Response) {
        let viewModel = Emailed.Save.ViewModel()
        self.view.displaySaveArticleToDb(viewModel: viewModel)
    }
    
}
