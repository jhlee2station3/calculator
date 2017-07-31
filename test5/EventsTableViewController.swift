//
//  EventsTableViewController.swift
//  test5
//
//  Created by station3 on 27/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EventsTableViewController: UITableViewController {
    
    var dataArray: JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters: Parameters = ["platform": "app_home"]
        
        Alamofire.request("https://dabang-prod-pr-884.herokuapp.com/api/3/events", parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                self.dataArray = JSON(value)
                self.tableView.reloadData()
                print(value)
            case .failure(let error):
                print(error)
            }
        }
        
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Determine the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return self.dataArray.count
    }
    
    //Populate the table view with text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "passEvent", for: indexPath) as? EventsTableCell {
            cell.configure(data: self.dataArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passURL"{
            let dest = segue.destination as? WebViewController
            if let cell = sender as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) {
                dest?.urlDisplay = self.dataArray[indexPath.row]["url"].url
                dest?.titleDisplay = self.dataArray[indexPath.row]["title"].string!
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! EventsTableCell
        self.performSegue(withIdentifier: "passURL", sender: cell)
    }
}

class EventsTableCell : UITableViewCell {
    
    @IBOutlet weak var titleEvents: UILabel!
    @IBOutlet weak var dateRangeEvents: UILabel!
    @IBOutlet weak var countdownEvents: UILabel!
    @IBOutlet weak var imageEvents: UIImageView!
    
    @IBOutlet var transparentView: UIView!
    
    func configure (data : JSON)
    {
        if let url = data["img"].url {
            self.imageEvents.image = UIImage(data: try! Data(contentsOf: url))
        }
        
        self.titleEvents.text = data["title"].string
        
        let date1 = data["period_from"].string!
        
        let endIndex1 = date1.index(date1.endIndex, offsetBy: -14)
        let truncated1 = date1.substring(to: endIndex1)
        
        let date2 = data["period_to"].string!
        let endIndex2 = date2.index(date1.endIndex, offsetBy: -14)
        let truncated2 = date2.substring(to: endIndex2)

        self.dateRangeEvents.text = truncated1.replacingOccurrences(of: "-", with: ".") + " ~ " + truncated2.replacingOccurrences(of: "-", with: ".")
        
        if data["remaining_days"].int! < 8 {
        self.countdownEvents.text = "D - " + "\(data["remaining_days"].int ?? 0)"
        } else {
            self.countdownEvents.text = ""
        }
        
        if data["remaining_days"].int == 0 {
            self.countdownEvents.isHidden = true
        } else {
            self.countdownEvents.isHidden = false
        }
        
        if data["finished"].int == 0 {
            transparentView.isHidden = true
        } else {
            transparentView.isHidden = false
        }
    }
}

