//
//  NetworkManagers.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/29/22.
//

import Foundation

class NetworkManager {
    
    static let shared   = NetworkManager()
    
    func fetchITunesApps(searchTerm: String, completed: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
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
                print("Failed to decode json:", error as Any)
                completed([], jsonErr)
            }
        }
        .resume()
    }
}
