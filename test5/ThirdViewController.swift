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
    var indexToPass2: IndexPath? = []
    var indexToPass3: IndexPath? = []
    var receivedTitle: String = ""
    var receivedContent: String = ""
    var receivedDate: String = ""
    var delegate: DataSentDelegate? = nil

    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var labelText: UITextField!
    @IBOutlet weak var dateButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if receivedContent != "" {
            let dateEditNew = Date()
            newTitle.isHidden = true
            self.navigationItem.title = receivedTitle
            labelText.text = receivedContent
            dateButton.text = DateFormatter.localizedString(from: dateEditNew, dateStyle: .medium, timeStyle: .medium)
    }
        else {
            let dateAddNew = Date()
            dateButton.text = DateFormatter.localizedString(from: dateAddNew, dateStyle: .medium, timeStyle: .medium)
            self.navigationItem.title = ""
            newTitle.isHidden = false
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
