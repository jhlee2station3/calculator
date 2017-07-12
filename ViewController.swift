//
//  ViewController.swift
//  test4
//
//  Created by Mika Lee on 7/12/17.
//  Copyright © 2017 Mika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNum = Double()
    var currentAr = String()
    var result = Double()
//  var pressedNotifier = false
//    var stackArray = [String]()
    
    @IBOutlet weak var calculatedValue: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentAr = "="
        calculatedValue.text = ("\(result)")
    }
    
    @IBAction func btnInput(_ sender: UIButton){
        let i = Int(sender.titleLabel!.text!)
        currentNum = currentNum * 10 + Double(i!)
        calculatedValue.text = ("\(currentNum)")
        //pressedNotifier = false
    }
    
    @IBAction func plusMinus (_ sender: UIButton)
    {
        currentNum = -1 * currentNum
        calculatedValue.text = ("\(currentNum)")
        //pressedNotifier = false
    }
    
    /*
    @IBAction func decimalPoint (_ sender: UIButton)
    {
        let digit = sender.currentTitle!
        if digit == "."{
            if
        calculatedValue.text = ("\(currentNum)")
    }
 
    */
    
    @IBAction func btnOperation(_ sender: UIButton){
        switch currentAr{
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
        //pressedNotifier = true
    }
    
    /*
 
    @IBAction func percentageChange (_ sender: UIButton)
    {
        if pressedNotifier == false
        {
            currentNum = 0.01 * currentNum
        }
        else
        {
            currentNum = 0.01 * currentNum

        }
        calculatedValue.text = ("\(currentNum)")
    }
 
    */
    
    @IBAction func btnClear (_ sender: UIButton)
    {
        currentNum = 0
        currentAr = "="
        result = 0
        calculatedValue.text = ("\(result)")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

