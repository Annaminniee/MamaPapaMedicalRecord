//
//  CommonPickerViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 高橋智一 on 2023/09/27.
//

import UIKit

protocol CommonPickerViewControllerDelegate: AnyObject {
    func didSelectItem(picker: CommonPickerViewController, didSelectItem item: String)
    func didTapCancel(picker: CommonPickerViewController)
}

/// 共通ピッカービュー
final class CommonPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Properties
    
    weak var delegate: CommonPickerViewControllerDelegate?
    private var items: [String] = []
    private var selectedItem: String = "ママ"

    // MARK: - IBOutlets

    @IBOutlet private weak var pickerView: UIPickerView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    // MARK: - IBActions
    
    /// 「決定」ボタンをタップ
    @IBAction private func tapDoneButton(_ sender: Any) {
        delegate?.didSelectItem(picker: self, didSelectItem: selectedItem)
    }
    
    /// 「キャンセル」ボタンをタップ
    @IBAction private func tapCancelButton(_ sender: Any) {
        delegate?.didTapCancel(picker: self)
    }
    
    // MARK: - Other Methods
    
    func setData(items: [String]) {
        self.items = items
    }
    
    // MARK: UIPickerViewDataSource
    /// 列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// 行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    // MARK: UIPickerViewDelegate
    /// 表示する行データ
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    /// 項目が選択された際に呼ばれる
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedItem = items[row]
    }
}
