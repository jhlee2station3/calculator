//
//  CalculatorViewController.swift
//  test4
//
//  Created by Mika Lee on 7/12/17.
//  Copyright © 2017 Mika. All rights reserved.
//


import UIKit

class CalculatorViewController: UIViewController {
    
    var currentNum = Double()
    var currentAr  = String()
    var result     = Double()

    @IBOutlet weak var calculatedValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAr = "="
        calculatedValue.text = ("\(result)")
        tabBarItem.badgeColor = UIColor.black
    }
    
    @IBAction func btnInput(_ sender: UIButton){
        let i = Int(sender.titleLabel!.text!)
        currentNum = currentNum * 10 + Double(i!)
        calculatedValue.text = ("\(currentNum)")
        //pressedNotifier = false
    }
    
    @IBAction func plusMinus (_ sender: UIButton) {
        currentNum = -1 * currentNum
        calculatedValue.text = ("\(currentNum)")
    }
    
    @IBAction func btnOperation(_ sender: UIButton) {
        switch currentAr {
        case "=":
            result = result + currentNum
        case "+":
            result = result + currentNum
        case "-":
            result = result - currentNum
        case "*":
            result = result * currentNum
        case "/":
            result = result / currentNum
        case "+/-":
            result = -1 * currentNum
        default:
            print("Error")
        }
        currentNum = 0
        calculatedValue.text = ("\(result)")
        currentAr = sender.titleLabel!.text! as String
    }
    
    @IBAction func btnClear (_ sender: UIButton) {
        currentNum = 0
        currentAr = "="
        result = 0
        calculatedValue.text = ("\(result)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

