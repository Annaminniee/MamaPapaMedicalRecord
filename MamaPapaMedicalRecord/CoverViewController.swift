//
//  CoverViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit
import FSCalendar

/// 表紙画面
final class CoverViewController: UIViewController {
    
    @IBOutlet private weak var monthLabel: UILabel!
    @IBOutlet private weak var todayLabel: UILabel!
    @IBOutlet private weak var memoListTableView: UITableView!
    
    @IBOutlet weak var calendarView: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "名前"
        configureCalendarBarButtonItem()
        configureFamilySettingBarButtonItem()
        configureLabel()
        configureCalendar()
    }
    
    func configureCalendarBarButtonItem() {
        let leftBarButton = UIBarButtonItem(
            image: UIImage(named: "calendarIcon"),
            style: .plain,
            target: self,
            action: #selector(tapCalendar)
        )
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func configureFamilySettingBarButtonItem() {
        let rightBarButton = UIBarButtonItem(
            image: UIImage (named: "familySettingIcon"),
            style: .plain,
            target: self,
            action: #selector(tapFamily)
        )
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    func configureLabel() {
        monthLabel.text = ""
        todayLabel.text = ""
    }
    
    func configureCalendar() {
        calendarView.appearance.headerDateFormat = "yyyy年MM月dd日"
        calendarView.appearance.todayColor = .orange
        calendarView.appearance.headerTitleColor = .orange
        calendarView.appearance.weekdayTextColor = .black
        calendarView.calendarWeekdayView.weekdayLabels[0].text = "日"
        calendarView.calendarWeekdayView.weekdayLabels[1].text = "月"
        calendarView.calendarWeekdayView.weekdayLabels[2].text = "火"
        calendarView.calendarWeekdayView.weekdayLabels[3].text = "水"
        calendarView.calendarWeekdayView.weekdayLabels[4].text = "木"
        calendarView.calendarWeekdayView.weekdayLabels[5].text = "金"
        calendarView.calendarWeekdayView.weekdayLabels[6].text = "土"
        calendarView.calendarWeekdayView.weekdayLabels[0].textColor = .red
        calendarView.calendarWeekdayView.weekdayLabels[6].textColor = .blue
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
