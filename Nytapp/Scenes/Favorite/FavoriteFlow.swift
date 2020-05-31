//
//  FavoriteFlow.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

enum Favorite {
    
    enum Fetch {
        
        struct Request {

        }
        
        struct Response {
            let result: Result<[ArticlePresentationModel], CommonError>
        }
        
        struct ViewModel {
            let models: [ArticlePresentationModel]
            let error: CommonError?
        }

    }

}
