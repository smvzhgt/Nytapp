//
//  SharedPresenter.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class SharedPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: SharedViewProtocol!
    
}


// MARK: - Extension
extension SharedPresenter: SharedPresenterProtocol {
    func presentFetchArticles(response: Shared.Fetch.Response) {
        switch response.result {
        case .success(let models):
            DispatchQueue.global(qos: .userInitiated).async {
                let presentationModels = models.map({
                    return ArticlePresentationModel(model: $0)
                })
                DispatchQueue.main.async { [weak self] in
                    let viewModel = Shared.Fetch.ViewModel(models: presentationModels, error: nil)
                    self?.view.displayFetchArticles(viewModel: viewModel)
                }
            }
        case .failure(let error):
            let viewModel = Shared.Fetch.ViewModel(models: [], error: error)
            view.displayFetchArticles(viewModel: viewModel)
        }
    }
    
    func presentSaveArticleToDb(response: Shared.Save.Response) {
        let viewModel = Shared.Save.ViewModel()
        self.view.displaySaveArticleToDb(viewModel: viewModel)
    }
    
}
