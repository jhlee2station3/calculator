//
//  FirstViewController.swift
//  test5
//
//  Created by station3 on 13/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

struct MyData {
    var title : String
    var content : String
    var dateString : String
    
    init(title:String, content:String, dateString:String) {
        self.title = title
        self.content = content
        self.dateString = dateString
    }
    
}

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataSentDelegate {
    
    var dataArray : [MyData] = []
    
    @IBOutlet var myTableView: UITableView!
    
    var indexToPass1: IndexPath = []
    
    var dicTitle1: String = ""
    
    var dicContent1: String = ""
    
    var dicDateString1: String = ""
    
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
            thirdViewController.indexToPass3 = indexToPass1
            thirdViewController.dicContent3 = dicContent1
            thirdViewController.dicKey3 = dicTitle1
            thirdViewController.dicDate3 = dicDateString1
        }
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
        
        let one = MyData(title: "How", content: "Wow", dateString: "")
        let two = MyData(title: "What", content: "Not", dateString: "")
        let three = MyData(title:"Why", content: "Lie", dateString: "")
        self.dataArray.append(one)
        self.dataArray.append(two)
        self.dataArray.append(three)
        self.myTableView.reloadData()
        
        print("\(self.dataArray)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
     {
     if editingStyle == UITableViewCellEditingStyle.delete {
     var keys = Array(dictionary.keys)
     keys.remove(at: 1)
     self.myTableView.reloadData()
     print("Delete")
     
     }
     */
    
    @IBAction func writeANote(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    //Delete selected row
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
        self.dataArray.remove(at: indexPath.row)
        self.myTableView.reloadData()
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Determine the number of rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return self.dataArray.count
    }
    
    //Populate the table view with text
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "passData", for: indexPath) as?FirstTableCell {
            cell.configure(data: self.dataArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keys = Array(dictionary.keys)
        let values = Array(dictionary.values)
        let cell = tableView.cellForRow(at: indexPath) as! FirstTableCell
        dicTitle1 = keys[indexPath.row]
        indexToPass1 = indexPath
        dicContent1 = values[indexPath.row][0]
        dicDateString1 = values[indexPath.row][1]
        self.performSegue(withIdentifier: "passData", sender: cell)
    }
    
    public func userDidEnterData(data: String) {
        var values = Array(dictionary.values)
        dicContent1 = values[indexToPass1.row][1]
        dicContent1 = data
    }
}

class FirstTableCell : UITableViewCell {
    
    @IBOutlet var titleLabel : UILabel?
    @IBOutlet var timeLabel  : UILabel?
    
    func configure(data : MyData) {
        self.titleLabel?.text = data.title
        self.timeLabel?.text = data.dateString
    }
    
}
