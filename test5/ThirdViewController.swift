//
//  ThirdViewController.swift
//  test5
//
//  Created by station3 on 14/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit
import os.log

class ThirdViewController: UIViewController {
    
    var valueToPass : String!
    var valueToPass1 : String!
    
    @IBOutlet weak var labelText: UITextView!
    
    func OKAction (_ sender: UIAlertAction)
    {
  //      navigationItem.title = keys[indexToPass.row]
   //     labelText.text = values[indexToPass.row]
//
  //      keys.append((navigationItem.title)!)
        keys.insert(navigationItem.title!, at: indexToPass.row)
        keys.remove(at: indexToPass.row + 1)
 //       values.append(labelText.text)
        values.insert(labelText.text!, at: indexToPass.row)
        values.remove(at: indexToPass.row + 1)
        self.performSegue(withIdentifier: "unwindToPrevious", sender: self)
    }
    
    func NotOKAction (_ sender: UIAlertAction)
    {
        self.performSegue(withIdentifier: "unwindToPrevious", sender: self)
    }
    
    @IBAction func buttonTapped (_ sender: UIBarButtonItem)
    {
        let alert3 = UIAlertController (title: "Save new version of the note?", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert3.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: self.OKAction))
        alert3.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: self.NotOKAction))
        self.present(alert3, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Title"
        navigationItem.title = valueToPass1
        labelText.text = valueToPass
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    @IBAction func goToFirstVC(_ sender: AnyObject) {
        
        savedData1 = finalTitleText.text
        //savedData2 = labelText.text
        self.performSegue(withIdentifier: "goToFirstVC", sender: savedData1)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToFirstVC"
        {
            if let destination = segue.destination as? FirstViewController
            {
                destination.receivedData1 = savedData1
                destination.receivedData1 = savedData2
            }
        }
    }
    
 
    @IBAction func saveItem (_ sender: UIButton)
    {
        finalTitleText.text = finalValueToPass2
        labelText.text =
    }
    
 */
    
    /*
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "passDataBack")
        {
            let destinController = segue.destination as! FirstViewController
            destinController.valueTopass = keys[indexPath.row]
            destinController.valueTopass1 = valueToPass1
        }
    }
 
 */
    
    //MARK: Navigaation
    //This method lets you configure a view controller before it's presented
    /*
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        //Configure the destination view controller only when the save button is pressed. 
        guard let button = sender as? UIBarButtonItem, button === saveButton else { os_log("The save button was not pressed, cnacelling", log: OSLog.default, type: .debug)
            return
        }
        
        let savedTitle = finalTitleText.text ?? ""
        let savedContent = labelText.text ?? ""
        
        
    }
 */
    

    /*
    // MARK: - Navigation
     
     //let navigationBar = UINavigationBar()
     let navigationItem = UINavigationItem()
     navigationItem.title = "Title"
     navigationBar.items = [navigationItem]

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
