//
//  NetworkManager.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 7/31/22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseUrlString = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endPointString = baseUrlString + username + "/followers?per_page=50&page=\(page)"
        guard let endPointURL = URL(string: endPointString) else {
            completed(nil, "This username created an invalid request")
            return
        }
        
        // error -> no internet, response -> internet, but bad response came back
        let task = URLSession.shared.dataTask(with: endPointURL) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again.")
                return
            }

            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data received from the server was invalid. Please try again.")
            }
        }
        task.resume()
    }
}
