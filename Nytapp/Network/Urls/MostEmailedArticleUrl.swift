//
//  MostEmailedArticleUrl.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation

struct MostEmailedArticleUrl {
    private var days: Int
    
    init(days: Int) {
        self.days = days
    }
}


// MARK: Extension
extension MostEmailedArticleUrl: UrlBuilderProtocol {
    
    func build() -> String {
        return "\(Endpoint.baseUrl)/emailed/\(days).json?api-key=\(NetworkUtil.API_KEY)"
    }
    
}
