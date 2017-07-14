//
//  FirstViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dict = [
        "Favorite Artists": "Pablo Picasso, Andy Warhol, The Beatles, Queen, The Chainsmokers",
        "Favorite Drinks": "Water, Cola, Sprite, Orange Juice, Ginger Ale",
        "Favorite Cities": "New York, London, Paris, Seoul, Cape Town",
        "Favorite Beers": "Tiger Beer, Cass, Kloud, Hite"
    ]
    
    
    var valueTopass: String!
    
    @IBOutlet weak var myTableView: UITableView!
    
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    */

    //Determine the number of rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dict.keys.count
    }
    
    //Populate the table view with text
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCell(withIdentifier: "passData", for: indexPath)
        let values = Array(self.dict.values)
        cell.textLabel?.text = values[indexPath.row]
        return cell
    }
    
    //Remove an item or delete an item simply by swiping left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        let values = Array(self.dict.keys)
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            dict.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        valueTopass = cell?.textLabel?.text
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
        destController.valueToPass = valueTopass
        }
    }
    
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
    
    //Each time our view appears, data refreshes
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

