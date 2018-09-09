//
//  ViewController.swift
//  Gluclose-App
//
//  Created by Nikhil D'Souza on 9/8/18.
//  Copyright © 2018 Nikhil D'Souza. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var circle: SpringButton!
    @IBOutlet weak var feedbackText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle.layer.cornerRadius = 68
        circle.animation = "fadeIn"
        display(option: 3)
    }
    
    @IBAction func circlePressed(_ sender: Any) {
        print("esketit")
    }
    
    func display(option: Int) {
        if option == 0 {
            circle.backgroundColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 1)
            feedbackText.text = "Control set! 👍"
            circle.animate()
        } else if option == 1 {
            circle.backgroundColor = UIColor(red: 139/255, green: 211/255, blue: 107/255, alpha: 1)
            feedbackText.text = "Healthy! 👌"
            circle.animate()
        } else if option == 2 {
            circle.backgroundColor = UIColor(red: 220/255, green: 66/255, blue: 66/255, alpha: 1)
            feedbackText.text = "Too high! 😧"
            circle.animate()
        } else {
            circle.alpha = 1
            circle.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0)
            let yourViewBorder = CAShapeLayer()
            yourViewBorder.strokeColor = UIColor.black.cgColor
            yourViewBorder.lineDashPattern = [2, 2]
            yourViewBorder.frame = circle.bounds
            yourViewBorder.fillColor = nil
            yourViewBorder.path = UIBezierPath(rect: circle.bounds).cgPath
            circle.layer.addSublayer(yourViewBorder)
        }
    }
}

