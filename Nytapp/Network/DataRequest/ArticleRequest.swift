//
//  ArticleRequest.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Alamofire

struct ArticlesRequest {
    
    // MARK: - Properties
    private var url: String
    
    // MARK: - Init
    init(url: String){
        self.url = url
    }
    
}

// MARK: - Extension
extension ArticlesRequest: RequestProtocol {
    
    var method: HTTPMethod { return .get }
    
    var parameters: Parameters? { return nil }
    
    var headers: HTTPHeaders? { return nil }
    
    func getDataRequest() -> DataRequest {
        return AF.request(url, method: method).validate()
    }
    
}
