//
//  HomeDatasource.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/20/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let brandonUser = User(name: "Brandon Hostetter", username: "@brandonhostetter", bioText: "This is my profile. Today is August 21st. We should see a total solar eclipse today at 2:30pm!", profileImage: #imageLiteral(resourceName: "profile_image"))
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        return [brandonUser, rayUser]
    }()
    
//    let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return self.users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return self.users.count
    }
}
