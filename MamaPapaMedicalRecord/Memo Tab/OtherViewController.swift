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
    @IBOutlet private weak var memoTableView: UITableView!
    
    /// 画像設定
    @IBOutlet private weak var imageView: UIImageView!
    
    /// 写真挿入設定
    @IBOutlet private weak var photoImageView: UIImageView!
    
    /// カメラ・動画挿入設定
    @IBOutlet private weak var cameraImageView: UIImageView!
    
    /// 削除
    @IBOutlet private weak var trashImageView: UIImageView!
     
     // MARK: - View Life-Cycle Methods
     
     override func viewDidLoad() {
         super.viewDidLoad()
         configureSaveButtonItem()
         navigationItem.title = "その他"
     }
     
     // MARK: - IBActions
     
     /// 形軟便ボタン
  
     
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
