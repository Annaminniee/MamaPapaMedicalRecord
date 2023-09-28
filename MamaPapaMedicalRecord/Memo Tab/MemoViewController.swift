//
//  MemoViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

/// メモ画面
final class MemoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var recordNameTextField: UITextField!
    @IBOutlet private weak var sleepHourTextField: UITextField!
    @IBOutlet private weak var sleepMinuteTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "症状"
        recordNameTextField.delegate = self
    }
    
    // MARK: - IBActions
    
    /// 熱ボタン
    @IBAction func feverButton(_ sender: CustomButton) {
    }
    
    /// 下痢ボタン
    @IBAction func diarrheaButton(_ sender: CustomButton) {
    }
    
    /// 嘔吐ボタン
    @IBAction func vomitingButton(_ sender: CustomButton) {
    }
    
    /// 痙攣ボタン
    @IBAction func convulsionButton(_ sender: CustomButton) {
    }
    
    /// 発疹ボタン
    @IBAction func rashButton(_ sender: CustomButton) {
    }
    
    /// その他ボタン
    @IBAction func otherButton(_ sender: CustomButton) {
    }
    
    /// 食欲普通ボタン
    @IBAction func appetiteNormal(_ sender: CustomButton) {
    }
    
    /// 食欲少しボタン
    @IBAction func appetiteLittleButton(_ sender: CustomButton) {
    }
    
    /// 食欲なしボタン
    @IBAction func appetiteNoButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できたボタン
    @IBAction func hydrationYesButton(_ sender: CustomButton) {
    }
    
    /// 水分補給少しボタン
    @IBAction func hydrationLittleButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できないボタン
    @IBAction func hydrationNoButton(_ sender: CustomButton) {
    }
    
    /// 機嫌良いボタン
    @IBAction func moodGoodButton(_ sender: CustomButton) {
    }
    
    /// 機嫌普通ボタン
    @IBAction func moodNormalButton(_ sender: CustomButton) {
    }
    
    /// 機嫌悪いボタン
    @IBAction func moodBadButton(_ sender: CustomButton) {
    }
    
    /// 機嫌ぐったりボタン
    @IBAction func moodTiredButton(_ sender: CustomButton) {
    }
    
    /// 睡眠多いボタン
    @IBAction func sleepMuchButton(_ sender: CustomButton) {
    }
    
    /// 睡眠普通ボタン
    @IBAction func sleepNormalButton(_ sender: CustomButton) {
    }
    
    /// 睡眠少ないボタン
    @IBAction func sleepLittleButton(_ sender: CustomButton) {
    }
    
    /// 睡眠寝てないボタン
    @IBAction func sleepNoButton(_ sender: CustomButton) {
    }
    
    /// 咳ありボタン
    @IBAction func coughYesButton(_ sender: CustomButton) {
    }
    
    /// 咳なしボタン
    @IBAction func coughNoButton(_ sender: CustomButton) {
    }
    
    /// 鼻水ありボタン
    @IBAction func snotYesButton(_ sender: CustomButton) {
    }
    
    /// 鼻水なしボタン
    @IBAction func snotNoButton(_ sender: CustomButton) {
    }
    
    /// 日にち設定
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
    }
    
    // MARK: - Other Methods
 
    private func configureSaveButtonItem() {
        let saveButton = UIBarButtonItem(title: "保存",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonTapped() {
        // 保存処理
    }
}

// MARK: - UITextFieldDelegate

extension MemoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        recordNameTextField.resignFirstResponder()
        return true
    }
}
