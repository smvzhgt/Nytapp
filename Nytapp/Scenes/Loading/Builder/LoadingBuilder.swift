//
//  LoadingBuilder.swift
//  Nytapp
//
//  Created by oleg on 31.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class LoadingBuilder: ModuleBuilder {

    init() {}


    // MARK: - Public Functions
    func build() -> UIViewController {
        
        let viewController = LoadingViewController()
        
        return viewController
    }

}
