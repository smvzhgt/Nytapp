//
//  StartInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class StartInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: StartPresenterProtocol!
    
    
    // MARK: - Private Properties
    
    
    // MARK: - Initializers
    init(presenter: StartPresenterProtocol) {
        self.presenter = presenter

        super.init()
    }
    
}


// MARK: - Extension
extension StartInteractor: StartInteractorProtocol {}
