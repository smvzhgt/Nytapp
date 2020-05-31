//
//  SharedBuilder.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class SharedBuilder: ModuleBuilder {

    init() {}

    func build() -> UIViewController {
        // Presenter
        let presenter = SharedPresenter()
        
        // Interactor
        let interactor = SharedInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Shared", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "SharedViewController") as! SharedViewController
        
        let tableViewDelegate = SharedTableViewDelegate(userInteraction: controller)
        
        controller.delegate = tableViewDelegate
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
