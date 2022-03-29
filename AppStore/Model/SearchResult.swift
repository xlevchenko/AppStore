//
//  SearchResult.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/28/22.
//

import Foundation


struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}


struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float
    let artworkUrl100: String
    let screenshotUrls: [String]
}
