//
//  Service.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/30/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let shared = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        // fetch json
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            print(homeDatasource.users.count)
            
            completion(homeDatasource)
        }) { (error) in
            print("error: ", error)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON error")
        }
    }
}
