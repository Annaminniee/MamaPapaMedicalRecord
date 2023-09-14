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
    
    let dateFormatter = DateFormatter()
    
    @IBOutlet private weak var monthLabel: UILabel!
    @IBOutlet private weak var todayLabel: UILabel!
    @IBOutlet private weak var memoListTableView: UITableView!
    @IBOutlet private weak var calendarView: FSCalendar!
    
    var memoDataList: [MemoDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "名前"
        configureCalendarBarButtonItem()
        configureFamilySettingBarButtonItem()
        configureLabel()
        configureCalendar()
        memoListTableView.dataSource = self
        memoListTableView.delegate = self
        setMemoData()
    }
    
    private func configureCalendarBarButtonItem() {
        let leftBarButton = UIBarButtonItem(
            image: UIImage(named: "calendarIcon"),
            style: .plain,
            target: self,
            action: #selector(tapCalendar)
        )
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    private func configureFamilySettingBarButtonItem() {
        let rightBarButton = UIBarButtonItem(
            image: UIImage (named: "familySettingIcon"),
            style: .plain,
            target: self,
            action: #selector(tapFamily)
        )
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    private func configureLabel() {
        monthLabel.text = formatMonthText()
        todayLabel.text = formatTodayText()
    }
    
    /// 今日の日付を"yyyy年MM月"で出力
    private func formatMonthText() -> String {
        dateFormatter.dateFormat = "yyyy年M月"
        let date1 = Date()
        let formattedDate1 = dateFormatter.string(from: date1)
        return formattedDate1
    }
    
    /// 今日の日付を"yyyy年MM月dd日（E）"で出力
    private func formatTodayText() -> String {
        dateFormatter.dateFormat = "yyyy年M月d日（E）"
        let date2 = Date()
        let formattedDate2 = dateFormatter.string(from: date2)
        return formattedDate2
    }
    
    private func configureCalendar() {
        calendarView.appearance.headerDateFormat = ""
        calendarView.appearance.todayColor = .orange
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
    
    func setMemoData() {
        let memoDataModel = MemoDataModel(text: "", recordDate: Date())
            memoDataList.append(memoDataModel)
    }
}

extension CoverViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let memoDataModel: MemoDataModel = memoDataList[indexPath.row]
        cell.textLabel?.text = memoDataModel.text
        cell.detailTextLabel?.text = "\(memoDataModel.recordDate)"
        return cell
    }
}

extension CoverViewController: UITableViewDelegate {
    func tableView(_ tableview: UITableView, didSelectRowAT indextPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoViewController = storyboard.instantiateViewController(identifier: "MemoViewController") as! MemoViewController
    }
}
