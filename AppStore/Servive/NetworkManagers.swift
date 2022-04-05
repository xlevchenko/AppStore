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
                print("Failed to decode json:", jsonErr)
                completed([], jsonErr)
            }
        }
        .resume()
    }
    
    
    func fetchTopPaid(completed: @escaping (AppsResult?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
       fetchAppResult(urlString: urlString, completed: completed)
    }
    
    func fetchTopFree(completed: @escaping (AppsResult?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
       fetchAppResult(urlString: urlString, completed: completed)
    }
    
    func fetchAppResult(urlString: String, completed: @escaping (AppsResult?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Failed to featch apps", error)
                completed(nil, error)
            }
            
            guard let data = data else { return }
            
            do {
                let appsResult = try JSONDecoder().decode(AppsResult.self, from: data)
                completed(appsResult, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completed(nil, jsonErr)
            }
        }
        .resume()
    }
    
    func fetchSocialApps(completed: @escaping ([SocialApps], Error?) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            if let error = error {
                print("Failed to featch apps", error)
                completed([], nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let socialResult = try JSONDecoder().decode([SocialApps].self, from: data)
                completed(socialResult, nil)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completed([], jsonErr)
            }
        }
        .resume()
    }
}
