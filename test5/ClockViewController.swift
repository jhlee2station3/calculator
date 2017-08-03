//
//  ClockViewController.swift
//  test5
//
//  Created by station3 on 02/08/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateTime()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateTime() {
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
    }
}
