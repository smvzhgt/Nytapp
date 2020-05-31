//
//  SharedFlow.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import Foundation

enum Shared {
    
    enum Fetch {
        
        struct Request {
            var days: Int
        }
        
        struct Response {
            let result: Result<[ArticleModel], CommonError>
        }
        
        struct ViewModel {
            let models: [ArticlePresentationModel]
            let error: CommonError?
        }

    }
    
    enum Save {
        
        struct Request {
            var article: ArticleModel
        }
        
        struct Response {
            let result: Result<Void, CommonError>
        }
        
        struct ViewModel {

        }

    }
    
}
