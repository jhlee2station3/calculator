//
//  ThirdViewController.swift
//  test5
//
//  Created by station3 on 14/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var valueToPass1 : String!
    var valueToPass2 : String!
    
    @IBOutlet weak var labelTextt: UITextView!
    
    @IBOutlet weak var finalTitleText: UITextField!
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "passData")
        {
            let destinController = segue.destination as! FirstViewController
            destinController.valueTopass = valueToPass1
            destinController.valueTopass1 = valueToPass2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let finalValueToPass2 = valueToPass2.replacingOccurrences(of: "\"", with: "")
        labelTextt.text = valueToPass1.replacingOccurrences(of: "\"", with: "")
        finalTitleText.text = finalValueToPass2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
