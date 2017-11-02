//
//  UpdateFriendDelegate.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 11/2/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import Foundation

// Intro: This protocol is used to transfer data from MoodPickerViewController to FriendViewController
// Info: The function has a parameter that takes in a Boolean type [true, false]

protocol UpdateFriendDelegate {
     func didUserUpdateFriend(_ bool: Bool)
}
