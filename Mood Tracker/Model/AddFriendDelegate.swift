//
//  AddFriendDelegate.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 11/1/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import Foundation

// Intro: This protocol is used to transfer data from NewFriendViewController to FriendViewController
// Info: The function has a parameter that takes in a Boolean type [true, false]

protocol AddFriendDelegate {
    func didUserAddNewFriend(bool: Bool)
}
