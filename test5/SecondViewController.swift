//
//  SecondViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

let date2 = Date()

class SecondViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var input: UITextView!
    @IBOutlet weak var titleTitle: UITextField!
    @IBOutlet weak var labelText2: UILabel!
    @IBOutlet weak var addItem: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    func addItems (action: UIAlertAction) {
//        keys.append(titleTitle.text!)
  //      values.append([input.text])
        titleTitle.text = ""
        input.text = ""
        tabBarController?.selectedIndex = 0
    }
    
    func backButton (_ sender: UIAlertAction) {
        if input.text == "" {
            if titleTitle.text == "" {
            tabBarController?.selectedIndex = 0
            }
        }
        else {
            titleTitle.text = ""
            input.text = ""
            tabBarController?.selectedIndex = 0
        }
    }

    @IBAction func alertNotified1 (_ sender: AnyObject) {
        let alert2 = UIAlertController (title: "Warning", message:
        "Do you want to go back? All changes will be discarded", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: backButton))
        alert2.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert2, animated: true, completion: nil)
    }
    
    @IBAction func alertNotified(_ sender: AnyObject) {
        if input.text! != "" {
            let alert1 = UIAlertController (title: "Warning", message:
            "Do you want to save this note?", preferredStyle: UIAlertControllerStyle.alert)
            alert1.addAction(UIAlertAction(title: "Yes", style: .default, handler: addItems))
            alert1.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            self.present(alert1, animated: true, completion: nil)
        }
        else if input.text == "" {
            let alert2 = UIAlertController (title: "Warning", message:
            "You have not entered anything", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert2, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText2.text = String(describing: date2)
    }

}
