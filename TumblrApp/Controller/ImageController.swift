//
//  SinglePostController.swift
//  TumblrApp
//
//  Created by Kamil Gacek on 26.08.2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import UIKit
import AVFoundation

class ImageController: UIViewController, UIScrollViewDelegate {
    
    var imageToDisplay: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        setupLayout()
    }
    
    func setupLayout() {
        
        view.addSubview(imageToDisplay)
        imageToDisplay.frame = CGRect(x: 0, y: 0, width: imageToDisplay.frame.width, height: imageToDisplay.frame.height)
        imageToDisplay.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageToDisplay.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        imageToDisplay.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageToDisplay.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
}
