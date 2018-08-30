//
//  ViewController.swift
//  TumblrApp
//
//  Created by Kamil Gacek on 24.08.2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import UIKit
import LBTAComponents

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
    var postArray: [Posts] = []
    
    var userUrlString = "" 
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(TumblrCell.self, forCellWithReuseIdentifier: cellId)
       
        let urlToApiString = "https://api.tumblr.com/v2/blog/\(userUrlString.lowercased()).tumblr.com/posts?api_key=X2coSoqjDJ7yV5a4Q3OJ9VcLdowZc2m2C3YDoiWKpo5dLEBfsh"
        getDataFromApi(urlString: urlToApiString)
    }
    
    func convertStringToImage(urlString: String) -> UIImage {
        guard let imageUrl = URL(string: urlString) else { return UIImage() }
        do {
            let imageData = try Data(contentsOf: imageUrl)
            if let image = UIImage(data: imageData) {
                 return image
            }
        } catch let error {
            print("error converting url to image: \(error)")
            return UIImage()
        }
        return UIImage()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TumblrCell
        if let photo = postArray[indexPath.row].photos {
            cell.photoImg.loadImage(urlString: photo[0].alt_sizes[4].url)
        }
        cell.titleText.text = postArray[indexPath.row].summary
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var estimatedHeight = CGFloat(0.00)
        if let photo = postArray[indexPath.row].photos {
            let approximatedWidth = view.frame.width
            let size = CGSize(width: approximatedWidth, height: 1000)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            let estimatedTitle = NSString(string: postArray[indexPath.row].summary).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            let imageHeight = convertStringToImage(urlString: photo[0].alt_sizes[4].url).size.height
            estimatedHeight = imageHeight + estimatedTitle.height * 3.5
        }
        
        return CGSize(width: view.frame.width, height: estimatedHeight )
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageController = ImageController()
            if let photo = self.postArray[indexPath.row].photos {
                let imageToSend = self.convertStringToImage(urlString: photo[0].alt_sizes[4].url)
                imageController.imageToDisplay.image = imageToSend
        }
        navigationController?.pushViewController(imageController, animated: true)
    }
    
    func getDataFromApi(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                var description: WebsiteDescription?
                do {
                    description = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                } catch let jsonError {
                    print("Unable to parse json, error: \(jsonError)")
                    self.navigationController?.popViewController(animated: true)
                    self.showAlertToUser()
                }
                if let description = description {
                    for post in description.response.posts {
                        self.postArray.append(post)
                    }
                }
                if let collection = self.collectionView {
                    collection.reloadData()
                }
            }
        }.resume()
    }
    
    func showAlertToUser() {
        let alert = UIAlertController(title: "Error Search", message: "Account with given user name does not exist...", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
 
}
