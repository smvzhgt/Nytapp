//
//  EmailedPresenter.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

final class EmailedPresenter: NSObject {
    
    // MARK: - Public Properties
    weak var view: EmailedViewProtocol!
    
}


// MARK: - Extension
extension EmailedPresenter: EmailedPresenterProtocol {}
