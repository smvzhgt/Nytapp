//
//  RequestExecutor.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestExecutorProtocol: class {
    func executeObject<T: Codable>(dataRequest: DataRequest, entity: T.Type, completion: @escaping (_ response: T?, _ error: CommonError?) -> ())
}


final class RequestExecutor {}


// MARK: - Extension
extension RequestExecutor: RequestExecutorProtocol {
    
    func executeObject<T: Codable>(dataRequest: DataRequest,
                                   entity: T.Type,
                                   completion: @escaping (_ response: T?, _ error: CommonError?) -> ()) {
        dataRequest.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, nil)
                } catch {
                    completion(nil, CommonError.decodingDataError)
                }
            case .failure(let error):
                completion(nil, CommonError.networkError(error: error))
            }
        }
    }
    
}
