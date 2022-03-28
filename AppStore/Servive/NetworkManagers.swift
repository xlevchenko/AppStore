//
//  NetworkManagers.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/29/22.
//

import Foundation

class NetworkManager {
    
    static let shared   = NetworkManager()
//    private let baseUrl = "https://api.github.com/users/"
    
    func fetchITunesApps(completed: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            if let error = error {
                print("Failed to featch apps", error)
                completed([], nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completed(searchResult.results, nil)
            } catch let jsonErr {
                print("Failed to decode json:", error)
                completed([], jsonErr)
            }
        }
        .resume()
    }
}
