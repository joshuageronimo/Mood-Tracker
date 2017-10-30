//
//  Friend.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 10/30/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import Foundation

struct Friend {
    // name is not an optional Strong since a Friend will always have a name
    private(set) public var name: String
    // mood is an option String type because initially a Friend does not have a mood set yet
    private(set) public var mood: String?
}
