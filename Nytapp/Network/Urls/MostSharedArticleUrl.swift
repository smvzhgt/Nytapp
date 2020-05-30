//
//  MostSharedArticleUrl.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation

struct MostSharedArticleUrl {
    private var days: Int
    
    init(days: Int) {
        self.days = days
    }
}


// MARK: Extension
extension MostSharedArticleUrl: UrlBuilderProtocol {
    
    func build() -> String {
        return "\(Endpoint.baseUrl)/shared/\(days)/facebook.json?api-key=\(NetworkUtil.API_KEY)"
    }
    
}
