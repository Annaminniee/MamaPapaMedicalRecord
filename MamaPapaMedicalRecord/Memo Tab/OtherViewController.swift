//
//  OtherViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// その他画面
final class OtherViewController: UIViewController {

    // MARK: - IBOutlets
     
     /// 記録日時設定
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温設定
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// メモ設定
    @IBOutlet private weak var tableView: UITextView!
    /// 画像設定
    @IBOutlet private weak var imageView: UIImageView!
   
     // MARK: - View Life-Cycle Methods
     
     override func viewDidLoad() {
         super.viewDidLoad()
         configureCancelButtonItem()
         configureSaveButtonItem()
         navigationItem.title = "その他"
     }
     
     // MARK: - IBActions
     
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
