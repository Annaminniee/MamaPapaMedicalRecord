//
//  FamilyInputViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 高橋智一 on 2023/09/26.
//

import UIKit
import Firebase

protocol FamilyInputViewControllerDelegate: AnyObject {
    func didSelectChildren(list: [String: String])
    func didSelectFamily(list: [String: String])
}

/// お子さま追加画面／家族追加画面
final class FamilyInputViewController: UIViewController {

    // MARK: - Properties
    
    /// FIRFirestoreインスタンスの作成
    let db = Firestore.firestore()
        
    weak var delegate: FamilyInputViewControllerDelegate?
    private var list: [String: String] = [:]
    private let datePicker = UIDatePicker()
    private var pageTitle: String = ""
    private var placeholder: String = ""
    private let familyList: [String] = ["ママ", "パパ", "おばあちゃん", "おじいちゃん", "その他"]
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var detailTextField: UITextField!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTextField()
    }
    
    // MARK: - Other Methods
    
    /// 前の画面から受け取る
    func setData(title: String, placeholder: String) {
        self.pageTitle = title
        self.placeholder = placeholder
    }
    
    private func configureUI() {
        // タイトルを設定
        navigationItem.title = pageTitle
        // プレースホルダーを設定
        detailTextField.placeholder = placeholder
        configureLeftBarButtonItem()
        configureRightBarButtonItem()
    }
    
    /// 「閉じる」ボタンの設定
    private func configureLeftBarButtonItem() {
        let closeButton = UIBarButtonItem(title: "閉じる",
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    /// 「閉じる」ボタンをタップ
    @objc func closeButtonTapped() {
        // 前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
    /// 「追加する」ボタンを作成
    private func createCustomButton() -> UIButton {
        let customButton = UIButton(type: .custom)
        customButton.setTitle("追加する", for: .normal) // ボタンタイトルを設定
        customButton.titleLabel?.font = UIFont.systemFont(ofSize: 15) // フォントサイズを設定
        customButton.backgroundColor = UIColor.systemBlue // 背景色を設定
        customButton.layer.cornerRadius = 16 // 角丸を設定
        customButton.frame = CGRect(x: 0, y: 0, width: 100, height: 32) // サイズを設定
        
        // customButtonにアクションを追加
        customButton.addTarget(self,
                               action: #selector(tapAddButton),
                               for: .touchUpInside)
        return customButton
    }
    
    /// 「追加する」ボタンの設定
    private func configureRightBarButtonItem() {
        let barButtonItem = UIBarButtonItem(customView: createCustomButton())
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    /// 「追加する」ボタンをタップ
    @objc func tapAddButton() {
        if let nameText = nameTextField.text,
           let detailText = detailTextField.text, nameText == "" || detailText == "" {
            showAlert()
        } else {
            list["name"] = nameTextField.text
            list["detail"] = detailTextField.text
            if pageTitle == "お子さまを追加" {
                delegate?.didSelectChildren(list: list)
            } else {
                delegate?.didSelectFamily(list: list)
            }
            saveData()
        }
    }
    
    /// テキストフィールドの設定
    private func configureTextField() {
        detailTextField.delegate = self
    }
    
    /// 日付ピッカービューを表示
    private func showDatePickerView() {
        let datePickerVC = DatePickerViewController()
        datePickerVC.delegate = self
        if let sheet = datePickerVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(datePickerVC, animated: true)
    }
    
    /// 家族ピッカービューを表示
    private func showFamilyPickerView() {
        let commonPickerVC = CommonPickerViewController()
        commonPickerVC.delegate = self
        commonPickerVC.setData(items: familyList)
        if let sheet = commonPickerVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(commonPickerVC, animated: true)
    }
    
    /// アラートを表示
    private func showAlert() {
        let alert = UIAlertController(title: "項目が空です",
                                      message: "２つの項目を入力してください。",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// Firestoreにデータを保存（ドキュメント名指定）
    private func saveData() {
        // 保存するデータを整形
        let userData: [String: Any] = list
        
        let timestamp = Timestamp(date: Date())
        db.collection("users").document("familySettingData").setData(userData) { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                // 保存失敗の場合
                print("Error adding document: \(error)")
                
            } else {
                // 保存成功の場合
                // 前の画面に戻る
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

// MARK: - UITextFieldDelegate

extension FamilyInputViewController: UITextFieldDelegate {
    /// detailTextFieldがタップされた時
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == detailTextField && pageTitle == "お子さまを追加" {
            showDatePickerView()
            // キーボードを表示しない
            return false
        } else if textField == detailTextField && pageTitle == "家族を招待" {
            showFamilyPickerView()
            // キーボードを表示しない
            return false
        }
        return true
    }
}

// MARK: - DatePickerViewControllerDelegate

extension FamilyInputViewController: DatePickerViewControllerDelegate {
    func didSelectDate(picker: DatePickerViewController, didSelectItem date: Date) {
        let dateFormatter = DateFormatter()
        // フォーマット設定
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        // ロケール設定（端末の暦設定に引きづられないようにする）
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        // タイムゾーン設定（端末設定によらず固定にしたい場合）
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        // 変換
        let dateString = dateFormatter.string(from: date)
        detailTextField.text = dateString
        dismiss(animated: true, completion: nil)
    }
    
    func didTapCancel(picker: DatePickerViewController) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - CommonPickerViewControllerDelegate

extension FamilyInputViewController: CommonPickerViewControllerDelegate {
    func didSelectItem(picker: CommonPickerViewController, didSelectItem item: String) {
        detailTextField.text = item
        dismiss(animated: true, completion: nil)
    }
    
    func didTapCancel(picker: CommonPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
}
