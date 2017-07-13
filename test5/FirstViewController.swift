//
//  ViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

var list = ["Wake Up", "Get to Work" , "Work Out", "Dinner"]

var valueTopass: String!

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        valueTopass = cell?.textLabel?.text
    }
    
    //Determine the number of rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    
    //Populate the table view with text
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    //Remove an item or delete an item simply by swiping left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath) as UITableViewCell!;

        valueTopass = currentCell?.textLabel?.text
        performSegue(withIdentifier: "cell", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "cell")
        {
        let destController = segue.destination as! SecondViewController
        destController.valueToPass = valueTopass
        tabBarController?.selectedIndex = 1
    }
    }
    
//    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        var DestViewController: SecondViewController = segue.destination as! SecondViewController
//        
//        let cell = self.myTableView.cellForRow(at: <#T##IndexPath#>)
//        
//        DestViewController.input.text = cell.textLabel?.text
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
 //   }
    
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

