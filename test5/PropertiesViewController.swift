//
//  PropertiesViewController.swift
//  test5
//
//  Created by station3 on 24/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

protocol SendColorDelegate: class {
    func EnterColor(_ propertiesviewcontroller: PropertiesViewController)
}

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
    
    var redColor: CGFloat = 0.0
    var greenColor: CGFloat = 0.0
    var blueColor: CGFloat = 0.0
    var delegate: SendColorDelegate? = nil
    
    @IBAction func redSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        redColor = CGFloat(slider.value)
        givePreview(red: redColor, green: greenColor, blue: blueColor)
        redLabel.text = "\(Int(slider.value * 255))"
    }
    
    @IBAction func greenSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        greenColor = CGFloat(slider.value)
        givePreview(red: redColor, green: greenColor, blue: blueColor)
        greenLabel.text = "\(Int(slider.value * 255))"
    }
    
    @IBAction func blueSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        blueColor = CGFloat(slider.value)
        givePreview(red: redColor, green: greenColor, blue: blueColor)
        blueLabel.text = "\(Int(slider.value * 255))"
    }
    
    @IBAction func opacityChanged(_ sender: Any) {
    }
    
    @IBAction func thicknessChanged(_ sender: Any) {
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if delegate != nil {
            print("nil????")
            delegate?.EnterColor(self)
        }
        print("Completed1")
        dismiss(animated: true, completion: nil)
        print("Completed2")
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func givePreview(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorImageView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        givePreview(red: redColor, green: greenColor, blue: blueColor)
        redSlider.value = Float(redColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        redLabel.text = "\(Int(redSlider.value * 255))"
        greenLabel.text = "\(Int(greenSlider.value * 255))"
        blueLabel.text = "\(Int(blueSlider.value * 255))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
