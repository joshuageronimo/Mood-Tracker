//
//  MoodPickerViewController.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 11/2/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import UIKit

class MoodPickerViewController: UIViewController {
    
    private var index: Int!
    private var name: String!
    // Will be intialized once the segue is called
    var delegate: UpdateFriendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // This function saves the data that was passed in by the segue from FriendViewController
    func currentFriend(friend: Friend, index: Int) {
        self.index = index
        self.name = friend.getName()
    }
    
    @IBAction func moodLevelButton(_ sender: UIButton) {
        // This line will update the current table view cell's data
        DataService.instance.updateMood(index: self.index, sameName: self.name, updatedMood: sender.currentTitle!)
        // Set didUserUpdateFriend to true, so that it will reload the TableView in FriendViewContrller
        delegate?.didUserUpdateFriend(true)
        // Go Back To Last View Controller
        self.navigationController?.popViewController(animated: true)
    }

}
