//
//  HomeDatasource.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/20/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map({ try T(json: $0) })
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]

    required init(json: JSON) throws {
        guard let usersArray = json["users"].array, let tweetsArray = json["tweets"].array
            else {
                throw NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON failed."])
            }

        self.users = try usersArray.decode()
        self.tweets = try tweetsArray.decode()
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return self.tweets[indexPath.item]
        }
        
        return self.users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return self.tweets.count
        }
        
        return self.users.count
    }
}
