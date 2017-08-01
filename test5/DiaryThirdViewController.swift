//
//  DiaryThirdViewController.swift
//  test5
//
//  Created by station3 on 25/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

protocol DiarySentDelegate : class {
    func userDidEnterDiary(_ diarythirdviewcontroller: DiaryThirdViewController)
}

class DiaryThirdViewController: UIViewController, SendColorDelegate, UITextViewDelegate {
    
    var diaryArray : [MyDiary] = []
    var indexToPass1: IndexPath = []
    var receivedTitleDiary: String = ""
    var receivedContentDiary: String = ""
    var receivedDateDiary: String = ""
    var receivedPictureDiary: UIImage? = nil
    var delegate: DiarySentDelegate? = nil
    var receivedPictureDataDiary: Data?
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var tool: UIImageView!
    var isDrawing = false
    var thickness: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    var lastPoint = CGPoint.zero
    var selectedImage: UIImage!

    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var diaryContent: UITextView!
    @IBOutlet weak var diaryTitle: UITextField!
    @IBOutlet weak var dateText: UILabel!
    
    @IBOutlet weak var toolIcon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.diaryContent.delegate = self
        tool = UIImageView()
        tool.frame = CGRect(x: self.pictureView.bounds.size.width, y: self.pictureView.bounds.size.height, width: 20, height: 20)
        tool.image = #imageLiteral(resourceName: "paint-brush-md")
        self.view.addSubview(tool)
        if !receivedContentDiary.isEmpty {
            let dateNew = Date()
            diaryTitle.isHidden = true
            self.navigationItem.title = receivedTitleDiary
            self.diaryContent.text = receivedContentDiary
            self.dateText.text = DateFormatter.localizedString(from: dateNew, dateStyle: .medium, timeStyle: .medium)
            self.pictureView.image = UIImage(data: receivedPictureDataDiary!)
        }
        else {
            diaryContent.text = "Enter text"
            diaryContent.textColor = UIColor.lightGray
            let dateNew = Date()
            dateText.text = DateFormatter.localizedString(from: dateNew, dateStyle: .medium, timeStyle: .medium)
            self.navigationItem.title = ""
            diaryTitle.isHidden = false            
            print("okey dokey")
        
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passColor1" {
            let propertiesviewcontroller: PropertiesViewController = segue.destination as! PropertiesViewController
            propertiesviewcontroller.delegate1 = self
            propertiesviewcontroller.redColor = self.red
            propertiesviewcontroller.greenColor = self.green
            propertiesviewcontroller.blueColor = self.blue
            propertiesviewcontroller.thicknessLevel = self.thickness
            propertiesviewcontroller.opacityLevel = self.opacity
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self.pictureView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.pictureView)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        drawLines(fromPoint: lastPoint, toPoint: lastPoint)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if diaryContent.textColor == UIColor.lightGray {
            diaryContent.text = nil
            diaryContent.textColor = UIColor.black
            print("okey dokey2")
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if diaryContent.text.isEmpty {
            diaryContent.text = "Enter text"
            diaryContent.textColor = UIColor.lightGray
        }
    }

    func drawLines (fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.pictureView.frame.size)
        pictureView.image?.draw(in: CGRect(x: 0, y: 0, width: self.pictureView.frame.width
            , height: self.pictureView.frame.height))
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y) )
        tool.center = CGPoint(x: toPoint.x + 30, y: toPoint.y + 150)
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(thickness)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
        context?.strokePath()
        
        pictureView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func EnterColor(_ propertiesviewcontroller: PropertiesViewController) {
        self.red = propertiesviewcontroller.redColor
        self.green = propertiesviewcontroller.greenColor
        self.blue = propertiesviewcontroller.blueColor
        self.thickness = propertiesviewcontroller.thicknessLevel
        self.opacity = propertiesviewcontroller.opacityLevel
    }
    
    func goBack (_ sender: UIAlertAction)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func save (_ sender: UIAlertAction)
    {
        if delegate != nil {
                delegate?.userDidEnterDiary(self)
                self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        let alert1 = UIAlertController (title: "Warning", message: "All changes will be discarded", preferredStyle: UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "Yes", style: .default, handler: goBack))
        alert1.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert1, animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        if diaryTitle.text != nil && diaryContent.text != nil && dateText.text != nil && pictureView.image != nil {
        let alert2 = UIAlertController(title: "Warning", message: "Do you want to save ths memo?", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: save))
        alert2.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert2, animated: true, completion: nil)
        } else {
            let alert3 = UIAlertController(title: "Warning", message: "You must enter all three fields.", preferredStyle: UIAlertControllerStyle.alert)
            alert3.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert3, animated: true, completion: nil)
        }
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
    
    @IBAction func clearBtn(_ sender: Any) {
        self.pictureView.image = nil
    }
    
    @IBAction func uploadBtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
    }
}

extension DiaryThirdViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = imagePicked
            self.pictureView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}



