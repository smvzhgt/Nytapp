//
//  MainTabBarViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // MARK: - Private Functions
    func setupUI() {
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


//        let mostViewedViewController = ViewedBuilder().build()
//        let viewedItem = UITabBarItem()
//        viewedItem.title = "Viewed"
//        viewedItem.image = UIImage(systemName: "square")
//        mostViewedViewController.tabBarItem = viewedItem

        
        let favoriteViewedViewController = FavoriteBuilder().build()
        let favoriteItem = UITabBarItem()
        favoriteItem.title = "Favorite"
        favoriteItem.image = UIImage(systemName: "star")
        favoriteViewedViewController.tabBarItem = favoriteItem
        
        self.viewControllers = [mostEmailedViewController,
                                mostSharedViewController,
//                                mostViewedViewController,
                                favoriteViewedViewController]
        
    }
    
}
