//
//  DrawingViewController.swift
//  test5
//
//  Created by station3 on 20/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController, SendColorDelegate {
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    var tool: UIImageView!
    var isDrawing = false
    
    var delegate1: ColorSentDelegate?
    
    var thickness: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    
    @IBOutlet weak var redOption: UIButton!
    @IBOutlet weak var orangeOption: UIButton!
    @IBOutlet weak var yellowOption: UIButton!
    @IBOutlet weak var greenOption: UIButton!
    @IBOutlet weak var blueOption: UIButton!
    @IBOutlet weak var purpleOption: UIButton!
    @IBOutlet weak var brownOption: UIButton!
    @IBOutlet weak var blackOption: UIButton!
    

    @IBOutlet weak var toolIcon: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tool = UIImageView()
        tool.frame = CGRect(x: self.imageView.bounds.size.width, y: self.imageView.bounds.size.height, width: 20, height: 20)
        tool.image = #imageLiteral(resourceName: "paint-brush-md")
        self.view.addSubview(tool)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self.imageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.imageView)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawLines(fromPoint: lastPoint, toPoint: lastPoint)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passColor" {
            let propertiesviewcontroller: PropertiesViewController = segue.destination as! PropertiesViewController
            propertiesviewcontroller.delegate1 = self
            propertiesviewcontroller.redColor = self.red
            propertiesviewcontroller.greenColor = self.green
            propertiesviewcontroller.blueColor = self.blue
            propertiesviewcontroller.thicknessLevel = self.thickness
            propertiesviewcontroller.opacityLevel = self.opacity
        }
    }
    
    func drawLines (fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.width
            , height: self.imageView.frame.height))
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y) )
        tool.center = CGPoint(x: toPoint.x, y: toPoint.y + 150)
            
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(thickness)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        }
    
    func EnterColor(_ propertiesviewcontroller: PropertiesViewController) {
        self.red = propertiesviewcontroller.redColor
        self.green = propertiesviewcontroller.greenColor
        self.blue = propertiesviewcontroller.blueColor
        self.thickness = propertiesviewcontroller.thicknessLevel
        self.opacity = propertiesviewcontroller.opacityLevel
    }
    
    @IBAction func colorsPicked(_ sender: AnyObject) {
        if sender.tag == 0 { //red
            (red,green,blue) = (255/255,0/255,0/255)
            } else if sender.tag == 1 { //orange
                (red,green,blue) = (255/255,153/255,0/255)
            } else if sender.tag == 2 { //yellow
                (red,green,blue) = (255/255,255/255,0/255)
            } else if sender.tag == 3 { //green
                (red,green,blue) = (128/255,255/255,0/255)
            } else if sender.tag == 4 { //blue
                (red,green,blue) = (0/255,0/255,255/255)
            } else if sender.tag == 5 { //purple
                (red,green,blue) = (127/255,0/255,255/255)
            } else if sender.tag == 6 { //brown
                (red,green,blue) = (204/255,102/255,0/255)
            } else if sender.tag == 7 { //black
                (red,green,blue) = (0/255,0/255,0/255)
            }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        self.imageView.image = nil
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Pick your option", message: "", preferredStyle: .actionSheet)
        
        if self.imageView.image != nil {
        actionSheet.addAction(UIAlertAction(title: "Save my image", style: .default, handler: {(_) in
            if let image = self.imageView.image  {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            
            present(actionSheet, animated: true, completion: nil)

        } else {
                let alert1 = UIAlertController (title: "Warning", message: "You have not drawn anything", preferredStyle: UIAlertControllerStyle.alert)
            alert1.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert1, animated: true, completion: nil)
        }
    }

    @IBAction func uploadBtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)

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
            self.imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
