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
    @IBAction private func feverButton(_ sender: CustomButton) {
    }
    
    /// 下痢ボタン
    @IBAction private func diarrheaButton(_ sender: CustomButton) {
    }
    
    /// 嘔吐ボタン
    @IBAction private func vomitingButton(_ sender: CustomButton) {
    }
    
    /// 痙攣ボタン
    @IBAction private func convulsionButton(_ sender: CustomButton) {
    }
    
    /// 発疹ボタン
    @IBAction private func rashButton(_ sender: CustomButton) {
    }
    
    /// その他ボタン
    @IBAction private func otherButton(_ sender: CustomButton) {
    }
    
    /// 食欲普通ボタン
    @IBAction private func appetiteNormal(_ sender: CustomButton) {
    }
    
    /// 食欲少しボタン
    @IBAction private func appetiteLittleButton(_ sender: CustomButton) {
    }
    
    /// 食欲なしボタン
    @IBAction private func appetiteNoButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できたボタン
    @IBAction private func hydrationYesButton(_ sender: CustomButton) {
    }
    
    /// 水分補給少しボタン
    @IBAction private func hydrationLittleButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できないボタン
    @IBAction private func hydrationNoButton(_ sender: CustomButton) {
    }
    
    /// 機嫌良いボタン
    @IBAction private func moodGoodButton(_ sender: CustomButton) {
    }
    
    /// 機嫌普通ボタン
    @IBAction private func moodNormalButton(_ sender: CustomButton) {
    }
    
    /// 機嫌悪いボタン
    @IBAction private func moodBadButton(_ sender: CustomButton) {
    }
    
    /// 機嫌ぐったりボタン
    @IBAction private func moodTiredButton(_ sender: CustomButton) {
    }
    
    /// 睡眠多いボタン
    @IBAction private func sleepMuchButton(_ sender: CustomButton) {
    }
    
    /// 睡眠普通ボタン
    @IBAction private func sleepNormalButton(_ sender: CustomButton) {
    }
    
    /// 睡眠少ないボタン
    @IBAction private func sleepLittleButton(_ sender: CustomButton) {
    }
    
    /// 睡眠寝てないボタン
    @IBAction private func sleepNoButton(_ sender: CustomButton) {
    }
    
    /// 咳ありボタン
    @IBAction private func coughYesButton(_ sender: CustomButton) {
    }
    
    /// 咳なしボタン
    @IBAction private func coughNoButton(_ sender: CustomButton) {
    }
    
    /// 鼻水ありボタン
    @IBAction private func snotYesButton(_ sender: CustomButton) {
    }
    
    /// 鼻水なしボタン
    @IBAction private func snotNoButton(_ sender: CustomButton) {
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
