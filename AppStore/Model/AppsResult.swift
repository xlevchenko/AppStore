//
//  AppsResult.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/4/22.
//

import Foundation

struct AppsResult: Decodable {
    let feed: Feed
}


struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}


struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
    let id: String
}
