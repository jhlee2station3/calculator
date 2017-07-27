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
            case .failure(let error):
                print(error)
            }
        }
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
}

class EventsTableCell : UITableViewCell {
    
    @IBOutlet weak var titleEvents: UILabel!
    @IBOutlet weak var dateRangeEvents: UILabel!
    @IBOutlet weak var countdownEvents: UILabel!
    @IBOutlet weak var imageEvents: UIImageView!

    func configure (data : JSON)
    {
        self.titleEvents.text = data["title"].string
        self.dateRangeEvents.text = data["period_from"].string! + "-" + data["period_to"].string!
        self.countdownEvents.text = data["remaining_days"].string
    }
}

