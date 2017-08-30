//
//  HomeDataSourceController.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/20/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    
    let errorMsgLabel: UILabel = {
        let label = UILabel()
        label.text = "Oops, something went wrong. Please try again later."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        // makes it relayout the page when the phone rotates
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.errorMsgLabel)
        self.errorMsgLabel.fillSuperview()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        self.setupNavigationBarItems()
        
        Service.shared.fetchHomeFeed { (homeDatasource, error) in
            if let err = error {
                self.errorMsgLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMsgLabel.text = "No information was returned :("
                    }
                }
                
                return
            }
            
            self.errorMsgLabel.isHidden = true
            self.datasource = homeDatasource
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // removes extra space from top of second cell
        // if we don't do this, there a little extra space at the top of dany's cell
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = self.datasource?.item(indexPath) as? User {
            // estimate the height of the cell based on user.bioText
            let approxWidthOfBioTextView = self.view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approxWidthOfBioTextView, height: 1000) // height is some arbitary large value
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            // 66 is height of nameLabel, usernameLabel, and a little extra
            return CGSize(width: self.view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: self.view.frame.width, height: 64)
    }
}
