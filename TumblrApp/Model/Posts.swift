//
//  Posts.swift
//  TumblrApp
//
//  Created by Kamil Gacek on 30.08.2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

struct Posts: Decodable {
    var summary: String
    var photos: [Photos]?
}
