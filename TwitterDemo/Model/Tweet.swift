//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/30/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
