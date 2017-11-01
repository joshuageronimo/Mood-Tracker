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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: Connect this to the DataService() 
    @IBAction func addFriendButton(_ sender: UIButton) {
        if newFriendName.text == "" {
            titleLabel.text = "Enter Your Friend's Name"
        } else {
            titleLabel.text = newFriendName.text!
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
