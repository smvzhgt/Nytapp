//
//  StartPresenter.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class StartPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: StartViewProtocol!
    
}


// MARK: - Extension
extension StartPresenter: StartPresenterProtocol {}
