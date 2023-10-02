//
//  VomitingViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// 嘔吐画面
final class VomitingViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録日時
    @IBOutlet private weak var dateTextField: UITextField!
    /// 体温
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// メモ
    @IBOutlet private weak var textView: UITextView!
    /// 画像挿入
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
        configureSaveButtonItem()
        navigationItem.title = "嘔吐"
    }
    
    // MARK: - IBActions
    
    /// 下痢「はい」ボタン
    @IBAction private func tapDiarrheaYesButton(_ sender: CustomButton) {
    }
    /// 下痢「いいえ」ボタン
    @IBAction private func tapDiarrheaNoButton(_ sender: CustomButton) {
    }
    /// 頭を打った「はい」ボタン
    @IBAction private func tapHitHeadYesButton(_ sender: CustomButton) {
    }
    /// 頭を打った「いいえ」ボタン
    @IBAction private func tapHitHeadNoButton(_ sender: CustomButton) {
    }
    /// 喘息はいボタン
    @IBAction private func tapAsthmaYesButton(_ sender: CustomButton) {
    }
    /// 喘息いいえボタン
    @IBAction private func tapAsthmaNoButton(_ sender: CustomButton) {
    }
    /// 写真挿入ボタン
    @IBAction private func tapPhotoButton(_ sender: UIButton) {
    }
    /// カメラ・動画記入ボタン
    @IBAction func tapCameraButton(_ sender: UIButton) {
    }
    /// 削除ボタン
    @IBAction func tapTrashButton(_ sender: UIButton) {
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

