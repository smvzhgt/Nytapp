//
//  MostEmailedRequest.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Alamofire

struct MostEmailedRequest {
    
    // MARK: - Properties
    private var days: Int
    
    
    // MARK: - Init
    init(days: Int){
        self.days = days
    }
    
}

// MARK: - Extension
extension MostEmailedRequest: RequestProtocol {
    var url: String {
        return "\(Endpoint.baseUrl)/emailed/\(days).json?api-key=\(NetworkUtil.API_KEY)"
    }
    
    var method: HTTPMethod { return .get }
    
    var parameters: Parameters? { return nil }
    
    var headers: HTTPHeaders? { return nil }
    
    func getDataRequest() -> DataRequest {
        return AF.request(url, method: method).validate()
    }
    
}


