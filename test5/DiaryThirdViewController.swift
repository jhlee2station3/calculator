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

class DiaryThirdViewController: UIViewController {
    
    var diaryArray : [MyDiary] = []
    var indexToPass1: IndexPath = []
    var receivedTitleDiary: String = ""
    var receivedContentDiary: String = ""
    var receivedDateDiary: String = ""
    var receivedPictureDiary: UIImage? = nil
    var delegate: DiarySentDelegate? = nil
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var diaryContent: UITextView!
    @IBOutlet weak var diaryTitle: UITextField!
    @IBOutlet weak var dateText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !receivedContentDiary.isEmpty {
            let dateNew = Date()
            diaryTitle.isHidden = true
            self.navigationItem.title = receivedTitleDiary
            diaryContent.text = receivedContentDiary
            dateText.text = DateFormatter.localizedString(from: dateNew, dateStyle: .medium, timeStyle: .medium)
            pictureView.image = receivedPictureDiary
        }
        else {
            diaryContent.text = "Enter text"
            diaryContent.textColor = UIColor.lightGray
            dateButton.text = DateFormatter.localizedString(from: dateAddNew, dateStyle: .medium, timeStyle: .medium)
            self.navigationItem.title = ""
            newTitle.isHidden = false
        
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack (_ sender: UIAlertAction)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func save (_ sender: UIAlertAction)
    {
        if delegate != nil {
            if diaryContent.text != nil {
                delegate?.userDidEnterDiary(self)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if diaryContent.textColor == UIColor.lightGray {
            diaryContent.text = nil
            diaryContent.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if diaryContent.text.isEmpty {
            diaryContent.text = "Enter text"
            diaryContent.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        let alert1 = UIAlertController (title: "Warning", message: "All changes will be discarded", preferredStyle: UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "Yes", style: .default, handler: goBack))
        alert1.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert1, animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        let alert2 = UIAlertController(title: "Warning", message: "Do you want to save ths memo?", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: save))
        alert2.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert2, animated: true, completion: nil)
    }
}


