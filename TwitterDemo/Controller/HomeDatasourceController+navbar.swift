//
//  HomeDatasourceController+navbar.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/21/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//

import UIKit


extension HomeDatasourceController {
    func setupNavigationBarItems() {
        self.setupLeftNavItems()
        self.setupRightNavItems()
        self.setupRemainingNavItems()
    }
    
    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleImageView
        
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        self.view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}