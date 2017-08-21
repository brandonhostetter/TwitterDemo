//
//  Cells.swift
//  TwitterDemo
//
//  Created by Brandon Hostetter on 8/20/17.
//  Copyright © 2017 Brandon Hostetter. All rights reserved.
//

import LBTAComponents

class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = .green
    }
}

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = .blue
    }
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.backgroundColor = .purple
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.backgroundColor = .orange
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .yellow
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        // add profile image to view
        addSubview(self.profileImageView)
        // add name label to view
        addSubview(self.nameLabel)
        // add username label to view
        addSubview(self.usernameLabel)
        // add bio text view to view
        addSubview(self.bioTextView)
        // add follow button to view
        addSubview(self.followButton)

        self.profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        self.nameLabel.anchor(self.profileImageView.topAnchor, left: self.profileImageView.rightAnchor, bottom: nil, right: self.followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        self.usernameLabel.anchor(self.nameLabel.bottomAnchor, left: self.nameLabel.leftAnchor, bottom: nil, right: self.nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        self.bioTextView.anchor(self.usernameLabel.bottomAnchor, left: self.usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        self.followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
