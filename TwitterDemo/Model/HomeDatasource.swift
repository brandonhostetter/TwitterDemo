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
        
        let danyUser = User(name: "Daenerys Targaryen", username: "@MotherOfDragons", bioText: "Daenerys of the House Targaryen, the First of Her Name, The Unburnt, Queen of the Andals, the Rhoynar and the First Men, Queen of Meereen, Khaleesi of the Great Grass Sea, Protector of the Realm, Lady Regnant of the Seven Kingdoms, Breaker of Chains and Mother of Dragons", profileImage: #imageLiteral(resourceName: "daenerys_targaryen_profile_image"))
        
        let jonSnowUser = User(name: "Jon Snow", username: "@JonSnow", bioText: "Knows nothing", profileImage: #imageLiteral(resourceName: "jon_snow_profile_image"))
        
        let grrmUser = User(name: "George RR Martin", username: "@GRRMspeaking", bioText: "New blog format coming soon! Till then... http://grrm.livejournal.com", profileImage: #imageLiteral(resourceName: "grrm_profile_image"))
        
        return [brandonUser, danyUser, jonSnowUser, grrmUser]
    }()
    
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
