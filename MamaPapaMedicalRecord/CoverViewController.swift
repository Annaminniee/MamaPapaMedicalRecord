//
//  CoverViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

/// 表紙画面
final class CoverViewController: UIViewController {
    
    @IBOutlet private weak var monthLabel: UILabel!
    @IBOutlet private weak var todayLabel: UILabel!
    @IBOutlet private weak var memoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "名前"
            
        let calendarBarButtonItem = UIBarButtonItem(image: UIImage(named: "calendarIcon"),
                                                    style: UIBarButtonItem.Style.plain,
                                                    target: self,
                                                    action: #selector(tapCalendar))
        self.navigationItem.leftBarButtonItem = calendarBarButtonItem
            
        let familyBarButtonItem = UIBarButtonItem(image: UIImage(named: "familySettingIcon"),
                                                    style: UIBarButtonItem.Style.plain,
                                                    target: self,
                                                    action: #selector(tapFamily))
        self.navigationItem.rightBarButtonItem = familyBarButtonItem
        
        let monthLabel = UILabel()
        monthLabel.frame = CGRect(x: 0, y: 88, width: 414, height: 20)
        monthLabel.textAlignment = NSTextAlignment.center
        let rgba = UIColor(red: 245, green: 188, blue: 245, alpha: 1)
        monthLabel.backgroundColor = rgba
        monthLabel.text = ""
        self.view.addSubview(monthLabel)
        
        let todayLabel = UILabel()
        todayLabel.frame = CGRect(x: 0, y: 385, width: 414, height: 20)
        todayLabel.textAlignment = NSTextAlignment.center
        todayLabel.backgroundColor = rgba
        todayLabel.text = ""
        self.view.addSubview(todayLabel)
        
        }
        
    @objc func tapCalendar() {
        print("カレンダーアイコンがタップされました")
        ///画面遷移処理
    }
        
    @objc func tapFamily() {
        print("家族アイコンがタップされました")
        ///画面遷移処理
    }
}
