//
//  PersistenceManager.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 8/7/22.
//

import Foundation

enum PersistenceActionType {
    case add
    case remove
}

struct PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys: String {
        case favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GGError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { follower in
                        follower.login == favorite.login
                    }
                }
                
                completed(saveFavorites(favorites: favorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GGError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites.rawValue) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToRetrieveFavorites))
        }
    }
    
    static func saveFavorites(favorites: [Follower]) -> GGError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites.rawValue)
            return nil
        }
        catch {
            return .unableToSaveFavorites
        }
    }
}
