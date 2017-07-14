//
//  SecondViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var input: UITextView!
    
    @IBOutlet weak var addItem: UIButton!
    
    var valueToPass : String? = nil
    
 //   var LabelText = String()
    
    func addItems (action: UIAlertAction)
    {
        list.append(input.text)
        input.text = ""
        tabBarController?.selectedIndex = 0
    }

        /*
        @IBAction func addItem(_ sender: AnyObject) {
        if (input.text != "")
        {
            list.append(input.text)
            input.text = ""
        }
     
    }
    */

    @IBAction func alertNotified(_ sender: AnyObject) {
        if input.text! != ""
        {
        let alert1 = UIAlertController (title: "Warning", message: "Do you want to save this note?", preferredStyle: UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "Yes", style: .default, handler: addItems))
        alert1.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert1, animated: true, completion: nil)
        }
        else if input.text == ""
        {
            let alert2 = UIAlertController (title: "Warning", message: "You have not entered anything", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert2, animated: true, completion: nil)
        }
}
    
    func receiveText (_ sender: Any?)
    {
        
    }
}

//        if addItem.isTouchInside && input.text != ""
//        {
//        let alert1 = UIAlertController (title: "Warning", message: "Do you really want to save this note?", preferredStyle: UIAlertControllerStyle.alert)
//            alert1.addAction(UIAlertAction(title: "Yes", style: .default, handler: addItems))
//            alert1.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
//            self.present(alert1, animated: true, completion: nil)
//        }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier = "catView"
        {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destinationViewController as! YourViewController
            let value = values[indexPath.row]
            controller.catTitleRe = value ["NAME"] as! String
        }
        }

    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
//            input.text = LabelText
            
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
 
  /*

}*/*/
