//
//  FirstScreenViewController.swift
//  test5
//
//  Created by station3 on 26/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.image = #imageLiteral(resourceName: "Screen Shot 2017-08-01 at 2.19.48 PM")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
