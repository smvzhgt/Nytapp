//
//  EmailedBuilder.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class EmailedBuilder: ModuleBuilder {

    init() {}

    func build() -> UIViewController {
        // Presenter
        let presenter = EmailedPresenter()
        
        // Interactor
        let interactor = EmailedInteractor(presenter: presenter)
        
        // View
        let storyboard = UIStoryboard.init(name: "Emailed", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "EmailedViewController") as! EmailedViewController
        
        controller.interactor = interactor
        
        presenter.view = controller
        
        return controller
    }

}
