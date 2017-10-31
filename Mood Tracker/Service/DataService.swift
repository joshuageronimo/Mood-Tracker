//
//  DataService.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 10/30/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import Foundation

class DataService {
    // Static let will provide a singleton design to DataService
    // This means it will only ever have one copy of instance - hence, save memory.
    static let instance = DataService()
    // Friend Dummy Data base
    private let friends = [
        Friend.init(name: "Joshua", mood: "😁"),
        Friend.init(name: "Shan", mood: "😡"),
        Friend.init(name: "Angel", mood: "😑"),
        Friend.init(name: "Derek", mood: "😭"),
        Friend.init(name: "Ray", mood: "😁"),
        Friend.init(name: "Sandy", mood: nil)
    ]
    // this fuction will return an array of Friend
    func getFriends() -> [Friend] {
        return friends
    }
}
