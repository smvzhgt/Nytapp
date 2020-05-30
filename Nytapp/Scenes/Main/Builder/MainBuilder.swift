//
//  StartBuilder.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class MainBuilder: ModuleBuilder {

    init() {}

    func build() -> UIViewController {
        return MainTabBarViewController()
    }

}
