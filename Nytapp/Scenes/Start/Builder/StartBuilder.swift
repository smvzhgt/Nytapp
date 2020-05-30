//
//  StartBuilder.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class StartBuilder: ModuleBuilder {

    init() {}

    func build() -> UIViewController {
        // Presenter
        let presenter = StartPresenter()
        
        // Interactor
        let interactor = StartInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Start", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "StartViewController") as! StartViewController
        
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
