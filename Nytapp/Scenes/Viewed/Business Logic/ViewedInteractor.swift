//
//  ViewedInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class ViewedInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: ViewedPresenterProtocol!
    
    
    // MARK: - Private Properties
    
    
    // MARK: - Initializers
    init(presenter: ViewedPresenterProtocol) {
        self.presenter = presenter

        super.init()
    }
    
}


// MARK: - Extension
extension ViewedInteractor: ViewedInteractorProtocol {}
