//
//  DiarrheaViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// メモ画面_下痢
final class DiarrheaViewController: UIViewController {
    
    // MARK: - Properties
    
    private let datePicker = UIDatePicker()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: - IBOutlets
    
    /// 記録日時設定
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温設定
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// その他設定
    @IBOutlet private weak var otherTextField: UITextField!
    /// におい設定
    @IBOutlet private weak var smellTextField: UITextField!
    /// メモ
    @IBOutlet private weak var textView: UITextView!
    /// 画像挿入設定
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
        configureDatePicker()
        configureCancelButtonItem()
        configureSaveButtonItem()
        navigationItem.title = "下痢"
        setupTapGestureRecognizer()
    }
    
    // MARK: - IBActions
    
    /// 形_軟便ボタンをタップ
    @IBAction private func tapSoftButton(_ sender: CustomButton) {
    }
    /// 形_泥状ボタンをタップ
    @IBAction private func tapMudButton(_ sender: CustomButton) {
    }
    /// 形_水様ボタンをタップ
    @IBAction private func tapLiquidButton(_ sender: CustomButton) {
    }
    /// 色_黄色ボタンをタップ
    @IBAction private func tapYellowButton(_ sender: CustomButton) {
    }
    /// 色_白色ボタンをタップ
    @IBAction private func tapWhiteButton(_ sender: CustomButton) {
    }
    /// 色_黒色ボタンをタップ
    @IBAction private func tapBlackButton(_ sender: CustomButton) {
    }
    /// 赤い箇所があるボタンをタップ
    @IBAction private func tapThereAreRedAreasButton(_ sender: Any) {
    }
    /// その他ボタンをタップ
    @IBAction private func tapOtherButton(_ sender: Any) {
    }
    /// 写真挿入ボタンをタップ
    @IBAction private func tapPhotoButton(_ sender: UIButton) {
    }
    /// カメラ・動画起動ボタンをタップ
    @IBAction private func tapCameraButton(_ sender: UIButton) {
    }
    /// 削除ボタンをタップ
    @IBAction private func tapTrashButton(_ sender: UIButton) {
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
    
    @objc func backButtonTapped() {
        // 前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
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
