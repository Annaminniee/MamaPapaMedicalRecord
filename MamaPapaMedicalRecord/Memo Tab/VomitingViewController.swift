//
//  VomitingViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// メモ画面_嘔吐画面
final class VomitingViewController: UIViewController {
    
    // MARK: - Properties
    
    private let datePicker = UIDatePicker()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: - IBOutlets
    
    /// 記録日時
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// メモ
    @IBOutlet private weak var textView: UITextView!
    /// 画像挿入
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
        configureDatePicker()
        configureCancelButtonItem()
        configureSaveButtonItem()
        navigationItem.title = "嘔吐"
        setupTapGestureRecognizer()
    }
    
    // MARK: - IBActions
    
    /// 下痢「はい」ボタンをタップ
    @IBAction private func tapDiarrheaYesButton(_ sender: CustomButton) {
    }
    /// 下痢「なし」ボタンをタップ
    @IBAction private func tapDiarrheaNoButton(_ sender: CustomButton) {
    }
    /// 頭を打った「はい」ボタンをタップ
    @IBAction private func tapHitHeadYesButton(_ sender: CustomButton) {
    }
    /// 頭を打った「いいえ」ボタンをタップ
    @IBAction private func tapHitHeadNoButton(_ sender: CustomButton) {
    }
    /// 喘息「あり」ボタンをタップ
    @IBAction private func tapAsthmaYesButton(_ sender: CustomButton) {
    }
    /// 喘息「なし」ボタンをタップ
    @IBAction private func tapAsthmaNoButton(_ sender: CustomButton) {
    }
    /// 写真挿入ボタンをタップ
    @IBAction private func tapPhotoButton(_ sender: UIButton) {
    }
    /// カメラ・動画記入ボタンをタップ
    @IBAction func tapCameraButton(_ sender: UIButton) {
    }
    /// 削除ボタンをタップ
    @IBAction func tapTrashButton(_ sender: UIButton) {
    }
    
    // MARK: - Other Methods
    
    /// 戻るボタンの設定
    private func configureCancelButtonItem() {
        let cancelButton = UIBarButtonItem(title: "閉じる",
                                           style: .plain,
                                           target: self,
                                           action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    /// 戻るボタンをタップ
    @objc func backButtonTapped() {
        // 前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
    /// 登録ボタンの設定
    private func configureSaveButtonItem() {
        let saveButton = UIBarButtonItem(title: "登録",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    /// 保存ボタンをタップ
    @objc func saveButtonTapped() {
        // TODO: 保存処理
    }
    
    /// 日付ピッカーの設定
    private func configureDatePicker() {
        // UITextFieldのキーボードをDatePickerに設定
        recordDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self,
                             action: #selector(datePickerValueChanged(_:)),
                             for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        recordDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    /// ツールバーの設定
    private func configureToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "決定",
                                         style: .done,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        let cancelButton = UIBarButtonItem(title: "キャンセル",
                                           style: .plain,
                                           target: self,
                                           action: #selector(toolBarCancelButtonTapped))
        
        toolbar.setItems([cancelButton,
                          UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil),
                          doneButton],
                         animated: false)
        
        recordDateTextField.inputAccessoryView = toolbar
    }
    
    /// 「決定」をタップ時
    @objc func doneButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月d日"
        recordDateTextField.text = dateFormatter.string(from: datePicker.date)
        // ピッカーを閉じる
        recordDateTextField.resignFirstResponder()
    }
    
    /// 「キャンセル」をタップ時
    @objc func toolBarCancelButtonTapped() {
        // ピッカーを閉じる
        recordDateTextField.resignFirstResponder()
    }
    
    /// タップジェスチャーリコグナイザをセットアップ
    private func setupTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    /// 画面のどこかをタップしてキーボードを閉じるメソッド
    @objc private func handleTap() {
        view.endEditing(true)
    }
}

