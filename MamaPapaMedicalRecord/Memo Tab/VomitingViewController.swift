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
    @IBOutlet private weak var memoTextField: UITableView!
    
    /// 画像挿入
    @IBOutlet private weak var imageView: UIImageView!
    
    /// 写真挿入
    @IBOutlet private weak var photoImageView: UIImageView!
    
    /// 画像・動画挿入
    @IBOutlet private weak var cameraImageView: UIImageView!
    
    /// 削除
    @IBOutlet private weak var trashImageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "嘔吐"
    }
    
    // MARK: - IBActions
    
    /// 下痢はいボタン
    @IBAction private func diarrheaYesButton(_ sender: CustomButton) {
    }
    
    /// 下痢いいえボタン
    @IBAction private func diarrheaNoButton(_ sender: CustomButton) {
    }
    
    /// 頭を打ったはいボタン
    @IBAction private func hitHeadYesButton(_ sender: CustomButton) {
    }
    
    /// 頭を打ったいいえボタン
    @IBAction private func hitHeadNoButton(_ sender: CustomButton) {
    }
    
    /// 喘息はいボタン
    @IBAction private func asthmaYesButton(_ sender: CustomButton) {
    }
    
    /// 喘息いいえボタン
    @IBAction private func asthmaNoButton(_ sender: CustomButton) {
    }
    
    // MARK: - Other Methods
    
    /// 戻るボタンの設定
    private func configureCancelButtonItem() {
        let cancelButton = UIBarButtonItem(title: "<戻る",
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

