//
//  NewFriendViewController.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 10/31/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import UIKit

class NewFriendViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newFriendName: UITextField!
    @IBOutlet weak var addFriendButtonLabel: UIButton!
    // delegate will get initialized when the segue gets called from the FriendViewController
    var delegate: AddFriendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When this button is clicked, whatever String is in the textfield will be added to the array database
    @IBAction func addFriendButton(_ sender: UIButton) {
        if newFriendName.text == "" {
            // Show instructions
            titleLabel.text = "Enter Your Friend's Name"
        } else {
            // add the new friend in the Database
            DataService.instance.addFriend(name: newFriendName.text!)
            // set bool to true since the user added a new friend
            delegate?.didUserAddNewFriend(bool: true)
            // pop back to the last ViewController
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // dismisses virtual keyboard when a user taps anywhere in the screen
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
