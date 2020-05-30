//
//  EmailedViewController.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit

final class EmailedViewController: UIViewController {

    // MARK: - Public Properties
    var interactor: EmailedInteractorProtocol!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}


// MARK: - Extensions
extension EmailedViewController: EmailedViewProtocol {}
