//
//  PropertiesViewController.swift
//  test5
//
//  Created by station3 on 24/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class PropertiesViewController: UIViewController {

    
    @IBOutlet weak var colorImageView: UIImageView!
    
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var thicknessLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func redSliderChanged(_ sender: Any) {
    }
    
    @IBAction func greenSliderChanged(_ sender: Any) {
    }
    
    @IBAction func blueSliderChanged(_ sender: Any) {
    }
    
    @IBAction func opacityChanged(_ sender: Any) {
    }
    
    @IBAction func thicknessChanged(_ sender: Any) {
    }
    
    @IBAction func saveBtn(_ sender: Any) {
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
