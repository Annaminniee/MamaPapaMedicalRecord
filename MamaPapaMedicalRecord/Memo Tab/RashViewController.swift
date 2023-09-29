//
//  RashViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// 発疹画面
final class RashViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録日時設定
    @IBOutlet private weak var dateTextField: UITextField!
    
    /// 体温設定
    @IBOutlet private weak var temperatureTextField: UITextField!
    
    /// 場所その他設定
    @IBOutlet private weak var placeOtherTextField: UITextField!
    
    /// メモ設定
    @IBOutlet private weak var memoTableView: UITableView!
    
    /// 画像設定
    @IBOutlet private weak var imageView: UIImageView!
    
    /// 写真挿入設定
    @IBOutlet private weak var photoImageView: UIImageView!
    
    /// 写真・動画挿入
    @IBOutlet private weak var cameraImageView: UIImageView!
    
    /// 削除
    @IBOutlet private weak var trashImageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "発疹"
    }
    
    // MARK: - IBActions
    
    /// 場所：頭ボタン
    @IBAction private func headButton(_ sender: CustomButton) {
    }
    
    /// 場所：顔ボタン
    @IBAction private func faceButton(_ sender: CustomButton) {
    }
    
    /// 場所：首ボタン
    @IBAction private func neckButton(_ sender: CustomButton) {
    }
    
    /// 場所：お腹ボタン
    @IBAction private func stomachButton(_ sender: CustomButton) {
    }
    
    /// 場所：背中ボタン
    @IBAction private func backButton(_ sender: CustomButton) {
    }
    
    /// 場所：股ボタン
    @IBAction private func crotchButton(_ sender: CustomButton) {
    }
    
    /// 場所：お尻ボタン
    @IBAction private func hipButton(_ sender: CustomButton) {
    }
    
    /// 場所：足ボタン
    @IBAction private func legButton(_ sender: CustomButton) {
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
