//
//  ViewController.swift
//  Gluclose-App
//
//  Created by Nikhil D'Souza on 9/8/18.
//  Copyright © 2018 Nikhil D'Souza. All rights reserved.
//

import UIKit
import Spring
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var circle: SpringButton!
    @IBOutlet weak var feedbackText: UILabel!
    
    var serverURL: String = ""
    var last5: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle.layer.cornerRadius = 68
        circle.animation = "fadeIn"
        display(option: 0)
    }
    
    @IBAction func circlePressed(_ sender: Any) {
        getData()
    }
    
    func getData() {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.observeSingleEvent(of: .value) { snapshot in
            for i in snapshot.children.allObjects as! [DataSnapshot] {
                let value = (i.value! as AnyObject)["data"]!! as! Int
                if value == 0 {
                    self.display(option: 1)
                } else if value == 1 {
                    self.display(option: 2)
                }
            }
        }
    }
    
    func display(option: Int) {
        if option == 0 {
            circle.backgroundColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 1)
            feedbackText.text = "Tap when ready 👍"
            circle.animate()
        } else if option == 1 {
            circle.backgroundColor = UIColor(red: 139/255, green: 211/255, blue: 107/255, alpha: 1)
            feedbackText.text = "Healthy! 👌"
            circle.animate()
        } else if option == 2 {
            circle.backgroundColor = UIColor(red: 220/255, green: 66/255, blue: 66/255, alpha: 1)
            feedbackText.text = "Too high! 😧"
            circle.animate()
        }
    }
}

