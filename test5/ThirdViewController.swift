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
    
    var dataArray3 : [MyData] = []
    
    var indexToPass3: IndexPath = []
    
    var receivedTitle: String = ""

    var delegate: DataSentDelegate? = nil

    @IBOutlet weak var labelText: UITextView!
    
    @IBOutlet weak var dateButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //     self.navigationItem.title = title
        labelText.text = dataArray3.title
   //     dateButton.text = content
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func OKAction (_ sender: UIAlertAction) {
        
    }
    
  //  func notOKAction (_ sender: UIAlertAction)
    
    @IBAction func saveBtnWasPressed(_ sender: AnyObject) {
        if delegate != nil {
            let data = labelText.text
            delegate?.userDidEnterData(data: data!)
            dismiss (animated: true, completion: nil)
        }
        
    

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
