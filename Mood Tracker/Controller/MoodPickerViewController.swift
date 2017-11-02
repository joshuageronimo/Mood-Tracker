//
//  MoodPickerViewController.swift
//  Mood Tracker
//
//  Created by Joshua Geronimo on 11/2/17.
//  Copyright © 2017 Joshua Geronimo. All rights reserved.
//

import UIKit

class MoodPickerViewController: UIViewController {
    
    // These are just testing to see if I can get the index of each cell
    // TODO: Now that we have access to the index, use it to update the Mood in the DataService
    // TODO: Don't forget to update the FriendViewController when the user hits the moodButton
    
    var x: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(x)
        // Do any additional setup after loading the view.
    }
    
    func friend(yo: Int) {
        self.x = yo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // TODO: Connect DataService
    @IBAction func moodLevelButton(_ sender: UIButton) {
        //DataService.instance.updateMood(index: <#T##Int#>, name: <#T##String#>, mood: <#T##String#>)
        self.navigationController?.popViewController(animated: true)
    }

}
