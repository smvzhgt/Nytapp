//
//  FavoriteBuilder.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class FavoriteBuilder: ModuleBuilder {

    init() {}

    func build() -> UIViewController {
        // Presenter
        let presenter = FavoritePresenter()
        
        // Interactor
        let interactor = FavoriteInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Favorite", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "FavoriteViewController") as! FavoriteViewController
        
        let tableViewDelegate = FavoriteTableViewDelegate(userInteraction: controller)
        
        controller.delegate = tableViewDelegate
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
