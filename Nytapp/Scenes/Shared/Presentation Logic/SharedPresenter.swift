//
//  SharedPresenter.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class SharedPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: SharedViewProtocol!
    
}


// MARK: - Extension
extension SharedPresenter: SharedPresenterProtocol {}
