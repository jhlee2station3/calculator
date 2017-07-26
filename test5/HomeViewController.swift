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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
