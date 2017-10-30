//
//  FriendTableViewCell.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 10/30/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendMood: UILabel!
    // this func updates the UILabel - name and mood
    func updateCell(friend: Friend) {
        friendName.text = friend.name
        friendMood.text = friend.mood ?? ""
    }
}
