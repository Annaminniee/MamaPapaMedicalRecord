//
//  CoverViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

class CoverViewController: UIViewController {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var memoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            navigationItem.title = "名前"
            
            let calendarBarButtonItem = UIBarButtonItem(image: UIImage(named: "calendarIcon"),
                                                        style: UIBarButtonItem.Style.plain,
                                                        target: self,
                                                        action: #selector(tapCalendar))
            self.navigationItem.leftBarButtonItem = calendarBarButtonItem
            
            let familyBarButtonItem = UIBarButtonItem(image: UIImage(named: "familyIcon"),
                                                      style: UIBarButtonItem.Style.plain,
                                                      target: self,
                                                      action: #selector(tapFamily))
            self.navigationItem.rightBarButtonItem = familyBarButtonItem
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
