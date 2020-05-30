//
//  StartViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class StartViewController: UIViewController {

    // MARK: - Public Properties
    var interactor: StartInteractorProtocol!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


// MARK: - Extensions
extension StartViewController: StartViewProtocol {}
