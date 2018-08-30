//
//  BaseClass.swift
//  TumblrApp
//
//  Created by Kamil Gacek on 30.08.2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import UIKit

class BaseClass: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been impletmented")
    }
    
    func setupViews(){
        backgroundColor = UIColor.blue
    }
    
}
