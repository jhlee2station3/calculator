//
//  ColorViewController.swift
//  test5
//
//  Created by station3 on 21/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

protocol ColorSentDelegate : class {
    func userDidEnterColor(_ colorviewcontroller: ColorViewController)
}

class ColorViewController: UIViewController {
    
    var redColor: CGFloat = 0
    var greenColor: CGFloat = 0
    var blueColor: CGFloat = 0
    var delegate: ColorSentDelegate? = nil
    
    @IBOutlet weak var displayColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closePopUp(_ sender: AnyObject) {
        if delegate != nil {
                delegate?.userDidEnterColor(self)
        }
        self.removeAnimate()
        print("Completed")
    }
    
    @IBAction func colorsPicked (_ sender: AnyObject) {
        if sender.tag == 0 { //red
            (redColor,greenColor,blueColor) = (255,0,0)
            displayColor.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
//            displayColor.text = "test"
        } else if sender.tag == 1 { //orange
            (redColor,greenColor,blueColor) = (255,153,0)
            displayColor.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0)
        } else if sender.tag == 2 { //yellow
            (redColor,greenColor,blueColor) = (255,255,0)
            displayColor.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 1.0)
        } else if sender.tag == 3 { //green
            (redColor,greenColor,blueColor) = (128,255,0)
            displayColor.backgroundColor = UIColor(red: 128/255, green: 255/255, blue: 0/255, alpha: 1.0)
        } else if sender.tag == 4 { //blue
            (redColor,greenColor,blueColor) = (0,0,255)
            displayColor.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0)
        } else if sender.tag == 5 { //purple
            (redColor,greenColor,blueColor) = (127,0,255)
            displayColor.backgroundColor = UIColor(red: 127/255, green: 0/255, blue: 255/255, alpha: 1.0)
        } else if sender.tag == 6 { //brown
            (redColor,greenColor,blueColor) = (204,102,0)
            displayColor.backgroundColor = UIColor(red: 204/255, green: 102/255, blue: 0/255, alpha: 1.0)
        } else if sender.tag == 7 { //black
            (redColor,greenColor,blueColor) = (0,0,0)
            displayColor.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        }
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion: {(finished: Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        })
    }
}

