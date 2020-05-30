//
//  MostSharedArticleRequest.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Alamofire

struct MostSharedArticleRequest {
    
    // MARK: - Properties
    private var days: Int
    
    
    // MARK: - Init
    init(days: Int){
        self.days = days
    }
    
}

// MARK: - Extension
extension MostSharedArticleRequest: RequestProtocol {
    var url: String {
        return "\(Endpoint.baseUrl)/shared/\(days)/facebook.json?api-key=\(NetworkUtil.API_KEY)"
    }
    
    var method: HTTPMethod { return .get }
    
    var parameters: Parameters? { return nil }
    
    var headers: HTTPHeaders? { return nil }
    
    func getDataRequest() -> DataRequest {
        return AF.request(url, method: method).validate()
    }
    
}
