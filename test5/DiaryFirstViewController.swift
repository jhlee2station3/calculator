//
//  DiaryFirstViewController.swift
//  test5
//
//  Created by station3 on 25/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

struct MyDiary {
    var titleDiary : String
    var contentDiary : String
    var dateStringDiary : String
    var imageDiary : UIImage
    
    init(titleDiary : String, contentDiary : String, dateStringDiary : String, imageDiary: UIImage) {
        self.titleDiary = titleDiary
        self.contentDiary = contentDiary
        self.dateStringDiary = dateStringDiary
        self.imageDiary = imageDiary
    }
}

import UIKit

class DiaryFirstViewController: UITableViewController, DiarySentDelegate {
    
    var diaryDataArray : [MyDiary] = []
    var indexToPass: IndexPath = []
    
    @IBOutlet var diaryTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    override func viewDidAppear(_ animated: Bool) {
        diaryTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.diaryTableView.dataSource = self
        self.diaryTableView.delegate = self
        
        let one = MyDiary(titleDiary: "Our Fantastic Four", contentDiary: "This is a photo of my family. They are Mommy, Daddy, Wayne and me!", dateStringDiary: DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium), imageDiary: #imageLiteral(resourceName: "Making-Family-Events-Special"))
        let two = MyDiary(titleDiary: "A Romantic Afternoon", contentDiary: "Nothing feels better than enjoying the breeze with my only one.", dateStringDiary: DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium), imageDiary: #imageLiteral(resourceName: "4852189-couple-images"))
    
        self.diaryDataArray.append(one)
        self.diaryDataArray.append(two)
        diaryTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passDiary" {
            let diarythirdviewcontroller: DiaryThirdViewController = segue.destination as! DiaryThirdViewController
            diarythirdviewcontroller.delegate = self
            diarythirdviewcontroller.receivedTitleDiary = self.diaryDataArray[indexToPass.row].titleDiary
            diarythirdviewcontroller.receivedContentDiary = self.diaryDataArray[indexToPass.row].contentDiary
            diarythirdviewcontroller.receivedDateDiary = self.diaryDataArray[indexToPass.row].dateStringDiary
            diarythirdviewcontroller.receivedPictureDiary = self.diaryDataArray[indexToPass.row].imageDiary
            diarythirdviewcontroller.indexToPass1 = self.indexToPass
        } else if segue.identifier == "passNewDiary" {
            let diarythirdviewcontroller: DiaryThirdViewController = segue.destination as! DiaryThirdViewController
            diarythirdviewcontroller.delegate = self
        }
    }
    
    // Delete selected row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.diaryDataArray.remove(at: indexPath.row)
            self.diaryTableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    //Determine the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return self.diaryDataArray.count
    }
    
    // Populate the table view with text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "passDiary", for: indexPath) as? DiaryTableCell {
          cell.configure(data: self.diaryDataArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! DiaryTableCell
        indexToPass = indexPath
        self.performSegue(withIdentifier: "passDiary", sender: cell)
    }
    
    func userDidEnterDiary(_ diarythirdviewcontroller: DiaryThirdViewController) {
        if diarythirdviewcontroller.diaryTitle.isHidden == true {
            let indexPath = diarythirdviewcontroller.indexToPass1
            self.diaryDataArray[(indexPath.row)].contentDiary = diarythirdviewcontroller.diaryContent.text
            self.diaryDataArray[(indexPath.row)].dateStringDiary = diarythirdviewcontroller.dateText.text!
            self.diaryDataArray[(indexPath.row)].imageDiary = diarythirdviewcontroller.pictureView.image!
            self.diaryTableView.reloadData()
        }
        else {
            let three = MyDiary(titleDiary: diarythirdviewcontroller.diaryTitle.text!, contentDiary: diarythirdviewcontroller.diaryContent.text, dateStringDiary: diarythirdviewcontroller.dateText.text!, imageDiary: diarythirdviewcontroller.pictureView.image!)
            self.diaryDataArray.append(three)
        }
    }
    
}

class DiaryTableCell : UITableViewCell {
    
    @IBOutlet var titleLabel : UILabel?
    @IBOutlet var timeLabel  : UILabel?
    @IBOutlet weak var previewDiaryPicture: UIImageView!
    
    func configure(data : MyDiary) {
        self.titleLabel?.text = data.titleDiary
        self.timeLabel?.text = data.dateStringDiary
        self.previewDiaryPicture.image = data.imageDiary
    }
}
