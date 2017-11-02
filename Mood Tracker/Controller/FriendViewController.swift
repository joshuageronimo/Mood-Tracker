//
//  FriendViewController.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 10/30/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddFriendDelegate, UpdateFriendDelegate {
   
    @IBOutlet weak var friendTableView: UITableView!
    var userAddedANewFriend = false
    var userUpdatedFriend = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set dataSource and delegate to FriendViewController
        friendTableView.dataSource = self
        friendTableView.delegate = self
        isTheTableViewEmpty()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isTheTableViewEmpty()
        // Will only update TableView if the user added a new Friend
        if userAddedANewFriend {
            updateTableView()
            // Will reload data if the user updates the mood of a friend
        } else if userUpdatedFriend {
            friendTableView.reloadData()
        }
        // set userAddedNewFriend back to false since the user has not added a new friend again
        userAddedANewFriend = false
        userUpdatedFriend = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Protocols / Delegate / Segues
    
    // This func is from the AddFriendDelegate protocol
    func didUserAddNewFriend(_ bool: Bool) {
        userAddedANewFriend = bool
    }
    // This func is from the UpdateFriendDelegate protocol
    func didUserUpdateFriend(_ bool: Bool) {
        userUpdatedFriend = bool
    }
    
    // this segue contains two seques [NewFriendViewController, MoodPickerViewController]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewFriendViewController"  {
            guard let newFriendViewController = segue.destination as? NewFriendViewController else {return}
            newFriendViewController.delegate = self
        } else if segue.identifier == "MoodPickerViewController" {
            if let moodPickerViewController = segue.destination as? MoodPickerViewController {
                moodPickerViewController.currentFriend(friend: DataService.instance.getFriends()[sender as! Int], index: sender as! Int)
                moodPickerViewController.delegate = self
            }
        }
    }
    
    // MARK: - Overriden TableView Functions
    
    // This function tells the data source to return the number of rows in a given section of a table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getFriends().count
    }
    
    // This function asks the data source for a cell to insert in a particular location of the table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendTableViewCell {
            let friend = DataService.instance.getFriends()[indexPath.row]
            cell.updateCell(friend: friend)
            return cell
        } else {
            return FriendTableViewCell()
        }
    }
    
    // This function will get the index of the tapped table cell view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = indexPath.row
        performSegue(withIdentifier: "MoodPickerViewController", sender: friend)
    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // remove the item from the data model
            DataService.instance.deleteFriend(atIndex: indexPath.row)
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            // Check if the TableView is empty
            isTheTableViewEmpty()
        }
    }
    
    // MARK: - My Custom TableView Functions
    
    // This function will update the TableView with the newest friend added by the user
    func updateTableView() {
        friendTableView.beginUpdates()
        friendTableView.insertRows(at: [
            NSIndexPath(row: DataService.instance.getFriends().count-1, section: 0) as IndexPath
            ], with: .automatic)
        friendTableView.endUpdates()
    }
    
    // This function will check if the data is empty. If so, it will print a message for the user
    func isTheTableViewEmpty() {
        if DataService.instance.getFriends().count == 0 {
            // else display the empty TableView Message
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: friendTableView.bounds.size.width, height: friendTableView.bounds.size.height))
            messageLabel.text = "You don't have any friends ☹️\n\nTo add a friend, tap the '+' button"
            messageLabel.numberOfLines = 3
            messageLabel.textAlignment = NSTextAlignment.center
            messageLabel.sizeToFit()
            friendTableView.backgroundView = messageLabel
            friendTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        } else {
            friendTableView.backgroundView = nil
            friendTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        }
    }
}

