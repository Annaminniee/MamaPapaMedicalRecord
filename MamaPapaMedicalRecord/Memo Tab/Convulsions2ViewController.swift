//
//  Convulsions2ViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// 痙攣画面
final class Convulsions2ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録日時
    @IBOutlet private weak var dateTextField: UITextField!
    /// 痙攣（分）
    @IBOutlet private weak var convulsionsMinuteTextField: UITextField!
    /// 痙攣（時間）
    @IBOutlet private weak var convulsionsSecondTextField: UITextField!
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
        navigationItem.title = "痙攣"
    }
    
    // MARK: - IBActions
    
    /// 意識「はい」ボタン
    @IBAction private func tapConsciousnessYesButton(_ sender: CustomButton) {
    }
    /// 意識「いいえ」ボタン
    @IBAction private func tapConsciousnessNoButton(_ sender: CustomButton) {
    }
    /// 写真挿入ボタン
    @IBAction private func tapPhotoButton(_ sender: UIButton) {
    }
    /// カメラ・動画起動ボタン
    @IBAction private func tapCameraButton(_ sender: UIButton) {
    }
    /// 削除ボタン
    @IBAction private func tapTrashButton(_ sender: UIButton) {
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

