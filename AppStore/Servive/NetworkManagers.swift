//
//  NetworkManagers.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 3/29/22.
//

import Foundation

class NetworkManager {
    
    static let shared   = NetworkManager()
    
    
    func fetchITunesApps(searchTerm: String, completed: @escaping (SearchResult?, Error?) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completed)
    }
    
    
    func fetchTopPaid(completed: @escaping (AppsResult?, Error?) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        
        fetchGenericJSONData(urlString: urlString, completion: completed)
    }
    
    
    func fetchTopFree(completed: @escaping (AppsResult?, Error?) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        
        fetchGenericJSONData(urlString: urlString, completion: completed)
    }
    
    
    func fetchSocialApps(completion: @escaping ([SocialResult]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    //declare my generic json function here
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            if let error = error {
                print("Failed to featch apps", error)
                completion(nil, error )
                return
            }
            
            guard let data = data else { return }
            
            do {
                let socialResult = try JSONDecoder().decode(T.self, from: data)
                completion(socialResult, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion(nil, jsonErr)
            }
        }
        .resume()
    }
}
