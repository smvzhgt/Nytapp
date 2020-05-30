//
//  RequestProtocol.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Alamofire

protocol RequestProtocol {
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    func getDataRequest() -> DataRequest
}
