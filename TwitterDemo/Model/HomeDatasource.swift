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

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        var users = [User]()
        let array = json["users"].array
        
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        
        self.users = users
    }
    
    let tweets: [Tweet] = {
        let brandonUser = User(name: "Brandon Hostetter", username: "@brandonhostetter", bioText: "This is my profile. Today is August 21st. We should see a total solar eclipse today at 2:30pm!", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let tweet = Tweet(user: brandonUser, message: "this is my tweet. blah blah blah. funny stuff here. I'm going to make this a long message so we can see how the cell expands when there is a lot of text. I'm going to make this a long message so we can see how the cell expands when there is a lot of text.")
        
        let tweet2 = Tweet(user: brandonUser, message: "shorter tweet")

        return [tweet, tweet2]
    }()
    
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
