//
//  DatePickerViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 高橋智一 on 2023/09/26.
//

import UIKit

protocol DatePickerViewControllerDelegate: AnyObject {
    func didSelectDate(picker: DatePickerViewController, didSelectItem date: Date)
    func didTapCancel(picker: DatePickerViewController)
}

/// 日付ピッカー
final class DatePickerViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: DatePickerViewControllerDelegate?

    // MARK: - IBOutlets
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    /// 「決定」ボタンをタップ
    @IBAction func tapDoneButton(_ sender: Any) {
        delegate?.didSelectDate(picker: self, didSelectItem: datePicker.date)
    }
    
    /// 「キャンセル」ボタンをタップ
    @IBAction func tapCancelButton(_ sender: Any) {
        delegate?.didTapCancel(picker: self)
    }
}
