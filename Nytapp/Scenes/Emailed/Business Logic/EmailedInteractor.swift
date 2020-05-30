//
//  EmailedInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class EmailedInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: EmailedPresenterProtocol!
    
    
    // MARK: - Private Properties
    
    
    // MARK: - Initializers
    init(presenter: EmailedPresenterProtocol) {
        self.presenter = presenter

        super.init()
    }
    
}


// MARK: - Extension
extension EmailedInteractor: EmailedInteractorProtocol {}
