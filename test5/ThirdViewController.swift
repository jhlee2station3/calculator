//
//  ThirdViewController.swift
//  test5
//
//  Created by station3 on 14/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

protocol DataSentDelegate : class {
    func userDidEnterData(_ thirdViewController: ThirdViewController)
}

class ThirdViewController: UIViewController {
    
    var dataArray3 : [MyData] = []
    var indexToPass3: IndexPath? = []
    var receivedTitle: String = ""
    var receivedContent: String = ""
    var receivedDate: String = ""
    var delegate: DataSentDelegate? = nil

    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var labelText: UITextView!
    @IBOutlet weak var dateButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if receivedContent != "" {
            newTitle.isHidden = true
            self.navigationItem.title = receivedTitle
            labelText.text = receivedContent
            dateButton.text = receivedDate
    }
        else {
            newTitle.isHidden = false
//            labelText.text = receivedContent
            dateButton.text = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func saveBtnWasPressed(_ sender: AnyObject) {
        if delegate != nil {
            if labelText.text != nil {
                delegate?.userDidEnterData(self)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}



/*
func addItems (action: UIAlertAction) {
    //        keys.append(titleTitle.text!)
    //      values.append([input.text])
    titleTitle.text = ""
    input.text = ""
    //   tabBarController?.selectedIndex = 0
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
*/
