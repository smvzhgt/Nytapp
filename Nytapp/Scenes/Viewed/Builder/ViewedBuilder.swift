//
//  ViewedBuilder.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class ViewedBuilder: ModuleBuilder {

    init() {}

    func build() -> UIViewController {
        // Presenter
        let presenter = ViewedPresenter()
        
        // Interactor
        let interactor = ViewedInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Viewed", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ViewedViewController") as! ViewedViewController
        
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
