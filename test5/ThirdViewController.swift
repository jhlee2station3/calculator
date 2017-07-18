//
//  ThirdViewController.swift
//  test5
//
//  Created by station3 on 14/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

protocol DataSentDelegate : class {
    func userDidEnterData(data: String)
}

class ThirdViewController: UIViewController {

    var delegate: DataSentDelegate? = nil
    
    @IBOutlet weak var labelText: UITextView!
    
    @IBOutlet weak var dateButton: UILabel!
    
    @IBAction func saveBtnWasPressed(_ sender: AnyObject) {
        let valueThreeToOne = labelText.text
        delegate?.userDidEnterData(data: valueThreeToOne!)
        dismiss (animated: true, completion: nil)
    }
/*
    let date2 = Date()

    var valueToPass1 : [String]!
    var valueToPass : String!
    
    func OKAction (_ sender: UIAlertAction) {
        keys.insert(navigationItem.title!, at: indexToPass.row)
        keys.remove(at: indexToPass.row + 1)
    //    values
        
        valueToPass1[0] = labelText.text
        
        //valueToPass1[0].insert([labelText.text!], at: indexToPass.row)
        values.remove(at: indexToPass.row + 1)
 //       values[indexToPass.row][1] = String(describing: date2)
        self.performSegue(withIdentifier: "unwindToPrevious", sender: self)
        print(valueToPass1)
    }
    
    func NotOKAction (_ sender: UIAlertAction) {
        self.performSegue(withIdentifier: "unwindToPrevious", sender: self)
    }
    
    @IBAction func buttonTapped (_ sender: UIBarButtonItem) {
        let alert3 = UIAlertController (title: "Save new version of the note?",
        message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert3.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default,
        handler: self.OKAction))
        alert3.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default,
        handler: self.NotOKAction))
        self.present(alert3, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = valueToPass
 //       labelText.text = valueToPass1[0]
        dateButton.text = valueToPass1[1]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
 */
}
