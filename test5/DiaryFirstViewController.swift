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
    
    init(titleDiary : String, contentDiary : String, dateStringDiary : String) {
        self.titleDiary = titleDiary
        self.contentDiary = contentDiary
        self.dateStringDiary = dateStringDiary
    }
}

import UIKit

class DiaryFirstViewController: UITableViewController {
    
    var diaryDataArray : [MyDiary] = []
    var indexToPass: IndexPath = []
    
    @IBOutlet var diaryTableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    @IBOutlet weak var diaryImagePreview: UIImageView!
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.diaryTableView.dataSource = self
        self.diaryTableView.delegate = self
        
        let one = MyDiary(titleDiary: "재밌었던 하루", contentDiary: "어제는 내 생일이었다.", dateStringDiary: DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium))
        let two = MyDiary(titleDiary: "피곤했던 하루", contentDiary: "어제 테니스를 너무 열심히 쳐서 다리가 아프다.", dateStringDiary: DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium))
        
        self.diaryDataArray.append(one)
        self.diaryDataArray.append(two)
        diaryTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        diaryTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passDiary" {
            let diarythirdviewcontroller: DiaryThirdViewController = segue.destination as! DiaryThirdViewController
    }
        
        
    func configure (data: MyDiary) {
        titleText.text = data.titleDiary
        dateText.text = data.dateStringDiary
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.diaryDataArray.remove(at: indexPath.row)
            self.diaryTableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return self.diaryDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "passDiary", for: indexPath) {
//          cell.configure(data: self.diaryDataArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        indexToPass = indexPath
        self.performSegue(withIdentifier: "passDiary", sender: cell)
    }
}
