//
//  FeverViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// メモ画面_熱
final class FeverViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録日時設定
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温設定
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// メモ設定
    @IBOutlet weak var memoTextView: UITextView!
    /// 画像設定
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "熱"
        setDismissKeyboard()
    }
    
    // MARK: - IBActions
    
    /// 解熱剤使用はいボタン
    @IBAction private func antipyreticAgentYesButton(_ sender: CustomButton) {
    }
    /// 解熱剤使用なしボタン
    @IBAction private func antipyreticAgentNoButton(_ sender: CustomButton) {
    }
    /// 写真挿入ボタン
    @IBAction func photoButton(_ sender: UIButton) {
    }
    /// カメラ・動画挿入ボタン
    @IBAction func cameraButton(_ sender: UIButton) {
    }
    /// 削除ボタン
    @IBAction func trashButton(_ sender: UIButton) {
    }
    
    // MARK: - Other Methods
    
    /// 戻るボタンの設定
    private func configureCancelButtonItem() {
        let cancelButton = UIBarButtonItem(title: "閉じる",
                                           style: .plain,
                                           target: self,
                                           action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelButtonTapped() {
        // 前の画面に戻る
        navigationController?.popViewController(animated: true)
    }
    
    private func configureSaveButtonItem() {
        let saveButton = UIBarButtonItem(title: "登録",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonTapped() {
        // 保存処理
    }
}

// MARK: - extensions

extension UIViewController {
    
    func setDismissKeyboard() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
