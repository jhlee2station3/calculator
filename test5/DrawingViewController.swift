//
//  DrawingViewController.swift
//  test5
//
//  Created by station3 on 20/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController, ColorSentDelegate {
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines (fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width
            , height: self.view.frame.height))
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y) )
            
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
            
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        }
    
    func userDidEnterColor(_ colorviewcontroller: ColorViewController) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        if colorviewcontroller.displayColor.backgroundColor == UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) {
            context?.setStrokeColor(UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor)
            print("Completed2")
        } else if colorviewcontroller.displayColor.backgroundColor == UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0) {
            (red, green, blue) = (1, 153/255, 0)
        }
        context?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
                let currentPoint = touch.location(in: self.view)
                drawLines(fromPoint: lastPoint, toPoint: currentPoint)
                lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
    }
    
    @IBAction func clearButton(_ sender: Any) {
        self.imageView.image = nil
    }
    
    @IBAction func showPopUp(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! ColorViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if let image = imageView.image  {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}
