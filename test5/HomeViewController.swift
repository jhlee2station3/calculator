//
//  HomeViewController.swift
//  test5
//
//  Created by station3 on 26/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func memoBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func calcBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func paintBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 3
    }
    
    @IBAction func diaryBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 4
    }
    
    @IBAction func eventsBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}