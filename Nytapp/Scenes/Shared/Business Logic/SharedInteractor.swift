//
//  SharedInteractor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class SharedInteractor: NSObject {
    
    // MARK: - Public Properties
    let presenter: SharedPresenterProtocol!
    
    
    // MARK: - Private Properties
    
    
    // MARK: - Initializers
    init(presenter: SharedPresenterProtocol) {
        self.presenter = presenter

        super.init()
    }
    
}


// MARK: - Extension
extension SharedInteractor: SharedInteractorProtocol {}
