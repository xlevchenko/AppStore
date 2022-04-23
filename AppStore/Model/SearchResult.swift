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
    let trackId: Int
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
    
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}
