//
//  DrawingViewController.swift
//  test5
//
//  Created by station3 on 20/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController{
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    var tool: UIImageView!
    var isDrawing = false
    
    @IBOutlet weak var toolIcon: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var displayColor: UILabel!
    
    var lastPoint = CGPoint.zero
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tool = UIImageView()
        tool.frame = CGRect(x: self.view.bounds.size.width, y: self.view.bounds.size.height, width: 20, height: 20)
        tool.image = #imageLiteral(resourceName: "paint-brush-md")
        self.view.addSubview(tool)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
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
    
    func drawLines (fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width
            , height: self.view.frame.height))
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y) )
        tool.center = toPoint
            
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
            
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        }
    
//    func userDidEnterColor(_ colorviewcontroller: ColorViewController) {
//        UIGraphicsBeginImageContext(self.view.frame.size)
//        let context = UIGraphicsGetCurrentContext()
//        if colorviewcontroller.displayColor.backgroundColor == UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) {
//            context?.setStrokeColor(UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor)
//            print("Completed2")
//        } else if colorviewcontroller.displayColor.backgroundColor == UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0) {
//            (red, green, blue) = (1, 153/255, 0)
//        }
//        context?.strokePath()
//        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//    }
    
    @IBAction func colorsPicked(_ sender: AnyObject) {
        if sender.tag == 0 { //red
            (red,green,blue) = (255/255,0/255,0/255)
            displayColor.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
            } else if sender.tag == 1 { //orange
                (red,green,blue) = (255/255,153/255,0/255)
                displayColor.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0)
            } else if sender.tag == 2 { //yellow
                (red,green,blue) = (255/255,255/255,0/255)
                displayColor.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: 1.0)
            } else if sender.tag == 3 { //green
                (red,green,blue) = (128/255,255/255,0/255)
                displayColor.backgroundColor = UIColor(red: 128/255, green: 255/255, blue: 0/255, alpha: 1.0)
            } else if sender.tag == 4 { //blue
                (red,green,blue) = (0/255,0/255,255/255)
                displayColor.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0)
            } else if sender.tag == 5 { //purple
                (red,green,blue) = (127/255,0/255,255/255)
                displayColor.backgroundColor = UIColor(red: 127/255, green: 0/255, blue: 255/255, alpha: 1.0)
            } else if sender.tag == 6 { //brown
                (red,green,blue) = (204/255,102/255,0/255)
                displayColor.backgroundColor = UIColor(red: 204/255, green: 102/255, blue: 0/255, alpha: 1.0)
            } else if sender.tag == 7 { //black
                (red,green,blue) = (0/255,0/255,0/255)
                displayColor.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
            }
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
        let actionSheet = UIAlertController(title: "Pick your option", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Open an image", style: .default, handler: {(_) in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Save my image", style: .default, handler: {(_) in
            if let image = self.imageView.image  {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func undoBtn(_ sender: Any) {
        
    }
    
    @IBAction func eraseBtn(_ sender: Any) {
        if (isDrawing == true) {
            (red,green,blue) = (0,0,0)
            tool.image = #imageLiteral(resourceName: "paint-brush-md")
            toolIcon.setTitle("Eraser", for: .normal)
            print("Yay")
        } else {
            (red,green,blue) = (1,1,1)
            tool.image = #imageLiteral(resourceName: "eraser-hi")
            toolIcon.setTitle("Pen", for: .normal)
            print("Nay")
        }
        isDrawing = !isDrawing
    }
}

extension DrawingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = imagePicked
        }
    }
}
