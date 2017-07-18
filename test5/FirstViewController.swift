//
//  FirstViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

var indexToPass: IndexPath = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataSentDelegate {
    
    var dictionary = [
        "Favorite Artists": ["Pablo Picasso, Andy Warhol", "\(Date())"],
        "Favorite Drinks": ["Water, Cola", "\(Date())"],
        "Favorite Cities": ["New York, London", "\(Date())"],
        "Favorite Brands": ["Apple, Samsung" , "\(Date())"]
    ]
    
    @IBOutlet weak var myTableView: UITableView!
    
    //Determine the number of rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            let keys = Array(dictionary.keys)
            return keys.count
    
    //Populate the table view with text
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "passData", for: indexPath) as! FristTableCell
    cell.configure()
    indexToPass = indexPath
    cell.titleLabel?.text = keys[indexToPass.row]
    return cell
    }
            
    //var values = Array(dictionary.values)

    
    //var receivedData1: String!
    //var receivedData2: String!
    //var valueTopass: String!
    //var valueTopass1: [String]!
    
 
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
    forRowAt indexPath: IndexPath) {
        //Remove an item or delete an item simply by swiping left
        if editingStyle == UITableViewCellEditingStyle.delete {
            keys.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FristTableCell
        valueTopass = keys[indexPath.row]
        indexToPass = indexPath
        valueTopass1 = values[indexPath.row]
        self.performSegue(withIdentifier: "passData", sender: cell)
    }

    @IBAction func writeANote(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passData" {
            let thirdViewController: ThirdViewController = segue.destination as! ThirdViewController
            thirdViewController.delegate = self
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Each time our view appears, data refreshes
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
        super.didReceiveMemoryWarning()
    }
    
    func userDidEnterData(data: String){
        //UITableView.dequeueReusableCell(UITableView).text  = data
    }
    
    
    /*
     override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
     if (segue.identifier == "passData")
     {
     let destController = segue.destination as! ThirdViewController
     destController.valueToPass = valueTopass
     destController.valueToPass1 = valueTopass1
     }
     }
     
     */
    
}

class FristTableCell : UITableViewCell {
    
    @IBOutlet var titleLabel : UILabel?
    @IBOutlet var timeLabel  : UILabel?
    
    func configure() {
        timeLabel?.text = String(describing: date)

        /*
        var keyList: [String] {
            get{
                return [String](dictionary.keys)
            }
        }
        
        let myRowKey = keyList[indexToPass.row]
        let myRowData = dictionary[myRowKey]
        */
    }
    
    
    
}
