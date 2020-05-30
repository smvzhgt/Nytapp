//
//  ViewedViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class ViewedViewController: UIViewController {

    // MARK: - Public Properties
    var interactor: ViewedInteractorProtocol!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


// MARK: - Extensions
extension ViewedViewController: ViewedViewProtocol {}
