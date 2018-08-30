//
//  SearchViewController.swift
//  TumblrApp
//
//  Created by Kamil Gacek on 30.08.2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextView.text = "" 
    }
    
    @objc func searchForUser(sender: UIButton!) {
            print(userNameTextView.text)

            let layout = UICollectionViewFlowLayout()
            let mainViewController = MainViewController(collectionViewLayout: layout)
            mainViewController.userUrlString = userNameTextView.text
            navigationController?.pushViewController(mainViewController, animated: true)
    }

    let searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.backgroundColor = UIColor.blue
        searchButton.layer.cornerRadius = 5
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        return searchButton
    }()
    
    let userNameTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.layer.cornerRadius = 5
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.autocapitalizationType = .none
        textView.textContainer.maximumNumberOfLines = 1
        textView.autocorrectionType = .no
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        return textView
    }()
    
    
    func setupView() {
        view.addSubview(userNameTextView)
        userNameTextView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        userNameTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userNameTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        userNameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(searchButton)
        searchButton.setTitle("Search For Tumblr ", for: .normal)
        searchButton.addTarget(self, action: #selector(searchForUser), for: .touchUpInside)
        searchButton.backgroundColor = UIColor.blue
        
        searchButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.topAnchor.constraint(equalTo: userNameTextView.bottomAnchor, constant: 100).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
