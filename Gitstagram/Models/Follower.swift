//
//  Follower.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 7/31/22.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}
