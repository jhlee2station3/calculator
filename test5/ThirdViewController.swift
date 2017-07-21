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
        if !receivedContent.isEmpty {
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
    
    func goBack (_ sender: UIAlertAction)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func save (_ sender: UIAlertAction)
    {
        if delegate != nil {
            if labelText.text != nil {
                delegate?.userDidEnterData(self)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: AnyObject) {
        let alert1 = UIAlertController (title: "Warning", message: "All changes will be discarded", preferredStyle: UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "Yes", style: .default, handler: goBack))
        alert1.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert1, animated: true, completion: nil)
    }

    @IBAction func saveBtnWasPressed(_ sender: AnyObject) {
        let alert2 = UIAlertController(title: "Warning", message: "Do you want to save ths memo?", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: save))
        alert2.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert2, animated: true, completion: nil)
    }
}
