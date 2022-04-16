//
//  Reviews.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/16/22.
//

import UIKit

struct Review: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
}

struct Author: Decodable {
    let name: Label
    
}

struct Label: Decodable {
    let label: String
}
