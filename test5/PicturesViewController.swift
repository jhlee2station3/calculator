//
//  PicturesViewController.swift
//  test5
//
//  Created by station3 on 03/08/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class PicturesViewController: UIViewController {
    
    var selectedImage : UIImage!
    
    @IBOutlet var selectedImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedImageView.image = selectedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
