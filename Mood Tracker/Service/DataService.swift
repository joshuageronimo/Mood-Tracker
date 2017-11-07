//
//  DataService.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 10/30/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import Foundation

// Intro: this class will be dealing with the database of the app

class DataService {
    
    // Static let will provide a singleton design to DataService
    // This means it will only ever have one copy of instance - hence, save memory.
    static let instance = DataService()
    
    // This array will hold the database of friends the user is keeping track of
    private var friends = [Friend]()
    
    // this computed property will return an array of Friend
    var friendArray: [Friend] {
        get {
            return friends
        }
    }
    
    // This function will update a friend's mood
    func updateMood(index: Int, sameName: String, updatedMood: String) {
        friends[index] = Friend(name: sameName, mood: updatedMood)
    }
    
    // this function will add another element to the friend database
    func addFriend(newName: String) {
        // mood will be nil since initially the friend will not have a mood tracked yet
        friends.append(Friend(name: newName, mood: nil))
    }
    
    // this
    func deleteFriend(atIndex: Int) {
        friends.remove(at: atIndex)
    }
}
