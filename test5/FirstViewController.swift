//
//  FirstViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataSentDelegate {
    
    @IBOutlet var myTableView: UITableView!
    
    var indexToPass: IndexPath = []
    
    var dictionary = [
        "Favorite Artists": ["Pablo Picasso, Andy Warhol", "\(Date())"],
        "Favorite Drinks": ["Water, Cola", "\(Date())"],
        "Favorite Cities": ["New York, London", "\(Date())"],
        "Favorite Brands": ["Apple, Samsung" , "\(Date())"]
    ]
    
    var dataDelegate : DataSentDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passData" {
            let thirdViewController: ThirdViewController = segue.destination as! ThirdViewController
                thirdViewController.delegate = self
            //            thirdViewController.indexPath = indexToPass
            //            thirdViewController.dicValue = dicValue
            //            thirdViewerController.dicKey = dicKey
        }
    }
    
    func userDidEnterData(data: String) {
      //receivinglabel.text = data
    }
    
    //Reload data everytime the page refreshes
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataDelegate = self
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func writeANote(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Determine the number of rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            let keys = Array(dictionary.keys)
            return keys.count
    }
    
    //Populate the table view with text
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = Array(dictionary.keys)
        let cell = tableView.dequeueReusableCell(withIdentifier: "passData", for: indexPath) as! FirstTableCell
        cell.configure()
        indexToPass = indexPath
        cell.titleLabel?.text = keys[indexToPass.row]
        return cell
    }
    
    //Remove an item or delete an item simply by swiping left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            var keys = Array(dictionary.keys)
            keys.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    /*
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let cell = tableView.cellForRow(at: indexPath) as! FirstTableCell
     valueTopass = keys[indexPath.row]
     indexToPass = indexPath
     valueTopass1 = values[indexPath.row]
     self.performSegue(withIdentifier: "passData", sender: cell)
     }
     
     func userDidEnterDataThreeToOne(data: String){
     //UITableView.dequeueReusableCell(UITableView).text  = data
     }
     
     
     
     //var values = Array(dictionary.values)
     
     
     //var receivedData1: String!
     //var receivedData2: String!
     //var valueTopass: String!
     //var valueTopass1: [String]!
     
     
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
     */
}

class FirstTableCell : UITableViewCell {
    
    @IBOutlet var titleLabel : UILabel?
    @IBOutlet var timeLabel  : UILabel?
    
    func configure() {
        timeLabel?.text = String(describing: Date())
    }
    
}
