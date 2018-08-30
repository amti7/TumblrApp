//
//  TumblrCell.swift
//  TumblrApp
//
//  Created by Kamil Gacek on 24.08.2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import UIKit
import LBTAComponents

class TumblrCell: BaseClass {
    
    let photoImg: CachedImageView = {
        let img = CachedImageView()
        return img
    }()
    
    let titleText: UITextView = {
        let titleText = UITextView()
        titleText.textColor = UIColor.darkGray
        titleText.font = UIFont.systemFont(ofSize: 20)
        titleText.textAlignment = .center
        titleText.isEditable = false
        titleText.isScrollEnabled = false
        return titleText
    }()
    
    override func setupViews() {
        addSubview(photoImg)
        addSubview(titleText)
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: photoImg)
        addConstraintsWithFormat(format: "H:|-10-[v0]|", views: titleText)
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-[v1(100)]", views: photoImg, titleText)
    }
    
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String:UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


