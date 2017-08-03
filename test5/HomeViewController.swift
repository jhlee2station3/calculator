//
//  HomeViewController.swift
//  test5
//
//  Created by station3 on 26/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var selectedImage : UIImage!
    
    @IBAction func memoBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func calcBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func paintBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 4
    }
    
    @IBAction func diaryBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 3
    }
    
    @IBAction func eventsBtn(_ sender: Any) {
        tabBarController?.selectedIndex = 5
    }
    
    @IBAction func photosBtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func clockBtn(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = imagePicked
            dismiss(animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
