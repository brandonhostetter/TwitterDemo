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
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = .yellow
        addSubview(self.nameLabel)
        nameLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
