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
    
    var passingData : MyData? = nil
    
    var delegate : DataSentDelegate?
    
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var indexToPass1: IndexPath = []
    
    var dicTitle1: String = ""
    
    var dicContent1: String = ""
    
    var dicDateString1: String = ""
    
    
    //Reload data everytime the page refreshes
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.delegate = self
        
        let one = MyData(title: "How", content: "Wow", dateString: String(describing: Date()))
        let two = MyData(title: "What", content: "Not", dateString: String(describing: Date()))
        let three = MyData(title:"Why", content: "Lie", dateString: String(describing: Date()))
        
        self.dataArray.append(one)
        self.dataArray.append(two)
        self.dataArray.append(three)
        self.myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passData" {
            let thirdViewController: ThirdViewController = segue.destination as! ThirdViewController
            thirdViewController.delegate = self
            thirdViewController.receivedContent = self.dataArray[indexToPass1.row].content
            thirdViewController.receivedDate = self.dataArray[indexToPass1.row].dateString
            thirdViewController.receivedTitle = self.dataArray[indexToPass1.row].title
            thirdViewController.indexToPass3 = self.indexToPass1
        }
        
        else if segue.identifier == "passNewData" {
            let thirdViewController: ThirdViewController = segue.destination as! ThirdViewController
            thirdViewController.delegate = self
        }
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "passData", for: indexPath) as? FirstTableCell {
            cell.configure(data: self.dataArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FirstTableCell
        indexToPass1 = indexPath
        self.performSegue(withIdentifier: "passData", sender: cell)
    }
    
    func userDidEnterData(_ thirdViewController: ThirdViewController) {
        if thirdViewController.newTitle.isHidden == true {
            let indexPath = thirdViewController.indexToPass3
            self.dataArray[(indexPath?.row)!].content = thirdViewController.labelText.text
            print("\(thirdViewController.labelText.text)")
            self.dataArray[(indexPath?.row)!].dateString = thirdViewController.dateButton.text!
            self.myTableView.reloadData()
        }
        else {
            let four = MyData(title: thirdViewController.newTitle.text!, content: thirdViewController.labelText.text, dateString: thirdViewController.dateButton.text!)
            self.dataArray.append(four)
        }
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
