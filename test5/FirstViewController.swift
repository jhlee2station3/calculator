//
//  FirstViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

var dictionary = [
    "Favorite Artists": "Pablo Picasso, Andy Warhol, The Beatles",
    "Favorite Drinks": "Water, Cola, Orange Juice",
    "Favorite Cities": "New York, London, Paris",
    "Favorite Brands": "Apple, Samsung, LG"
]

var values = Array(dictionary.values)

var keys = Array(dictionary.keys)

var indexToPass: IndexPath = []


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var receivedData1: String!
    var receivedData2: String!
    
    var valueTopass: String!
    var valueTopass1: String!
    
    @IBOutlet weak var myTableView: UITableView!

    //Determine the number of rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return keys.count
    }
    
    //Populate the table view with text
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passData", for: indexPath)
        indexToPass = indexPath
        cell.textLabel?.text = keys[indexToPass.row]
        return cell
    }
    
    //Remove an item or delete an item simply by swiping left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            keys.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        valueTopass = cell?.textLabel?.text
        indexToPass = indexPath
        valueTopass1 = values[indexToPass.row]
        self.performSegue(withIdentifier: "passData", sender: cell)
    }

    
    @IBAction func writeANote(_ sender: UIButton)
    {
        tabBarController?.selectedIndex = 1
    }
    
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "passData")
        {
        let destController = segue.destination as! ThirdViewController
        destController.valueToPass1 = valueTopass
        destController.valueToPass = valueTopass1
        }
    }
    
    //Each time our view appears, data refreshes
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let cell = tableView.cellForRow(at: indexPath)
 //       receivedData1 = cell?.textLabel?.text
 //       receivedData2 = values[indexPath.row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToPrevious (segue: UIStoryboardSegue){}
    
    //tabBarController?.selectedIndex = 1
    
//    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        var DestViewController: SecondViewController = segue.destination as! SecondViewController
//        
//        let cell = self.myTableView.cellForRow(at: <#T##IndexPath#>)
//        
//        DestViewController.input.text = cell.textLabel?.text
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
 //   }
    /*
    let indexPath = tableView.indexPathForSelectedRow!
    let currentCell = tableView.cellForRow(at: indexPath) as UITableViewCell!;
    
    valueTopass = currentCell?.textLabel?.text
    performSegue(withIdentifier: "cell", sender: self)
 */
    
}

