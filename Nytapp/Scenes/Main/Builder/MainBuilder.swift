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
        
        let mostEmailedViewController = EmailedBuilder().build()
        let emailedItem = UITabBarItem()
        emailedItem.title = "Emailed"
        emailedItem.image = UIImage(systemName: "circle")
        mostEmailedViewController.tabBarItem = emailedItem
        
        
        let mostSharedViewController = SharedBuilder().build()
        let sharedItem = UITabBarItem()
        sharedItem.title = "Shared"
        sharedItem.image = UIImage(systemName: "triangle")
        mostSharedViewController.tabBarItem = sharedItem
        
        
        let mostViewedViewController = ViewedBuilder().build()
        let viewedItem = UITabBarItem()
        viewedItem.title = "Viewed"
        viewedItem.image = UIImage(systemName: "square")
        mostViewedViewController.tabBarItem = viewedItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mostEmailedViewController, mostSharedViewController, mostViewedViewController]

        return tabBarController
    }

}
