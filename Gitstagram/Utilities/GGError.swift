//
//  GGError.swift
//  Gitstagram
//
//  Created by Eli Hartnett on 8/1/22.
//

import Foundation

enum GGError: String, Error {
    case invalidUsername = "This username created an invalid request."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidData = "The data received from the server was invalid. Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    
    case unableToRetrieveFavorites = "There was an error retrieving favorites. Please try again."
    case unableToSaveFavorites = "There was an error saving favorites. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You have already favorited this user."
}
