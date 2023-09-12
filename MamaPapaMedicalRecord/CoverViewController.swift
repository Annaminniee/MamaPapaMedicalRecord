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
        configureCalendarBarButtonItem()
        configurefamilySettingBarButtonItem()
        configuremonthLabel()
        configuretodayLabel()
    }
    
    func configureCalendarBarButtonItem () {
        let leftBarButton = UIBarButtonItem(
            image: UIImage(named: "calendarIcon"),
            style: .plain,
            target: self,
            action: #selector(tapCalendar)
        )
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func configurefamilySettingBarButtonItem () {
        let rightBarButton = UIBarButtonItem(
            image: UIImage (named: "familySettingIcon"),
            style: .plain,
            target: self,
            action: #selector(tapFamily)
        )
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    func configuremonthLabel () {
        monthLabel.frame = CGRect(x: 0, y: 88, width: 50, height: 20)
        monthLabel.textAlignment = NSTextAlignment.center
        monthLabel.text = ""
        self.view.addSubview(monthLabel)
    }
    
    func configuretodayLabel () {
        todayLabel.frame = CGRect(x: 0, y: 408, width: 50, height: 20)
        todayLabel.textAlignment = NSTextAlignment.center
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
