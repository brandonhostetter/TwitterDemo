//
//  Service.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/30/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//


// let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
// let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home1")
// let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home_with_error")


import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let shared = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        // fetch json
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON error")
        }
    }
}
