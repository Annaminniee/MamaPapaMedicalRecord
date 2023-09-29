//
//  DiarrheaViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// 痙攣画面
final class DiarrheaViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録日時
    @IBOutlet weak var dateTextField: UITextField!
    
    /// 痙攣（分）
    @IBOutlet weak var diarrheaMinuteTextField: UITextField!
    
    /// 痙攣（時間）
    @IBOutlet weak var diarrheaSecondTextField: UITextField!
    
    /// 体温
    @IBOutlet weak var temperatureTextField: UITextField!
    
    /// メモ
    @IBOutlet weak var memoTableView: UITableView!
    
    /// 画像挿入
    @IBOutlet weak var imageView: UIImageView!
    
    /// 写真挿入
    @IBOutlet weak var photoImageView: UIImageView!
    
    /// カメラ・動画挿入
    @IBOutlet weak var cameraImageView: UIImageView!
    
    /// 削除
    @IBOutlet weak var trashImageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "痙攣"
    }
    
    // MARK: - IBActions
    
    /// 意識はいボタン
    @IBAction func consciousnessYesButton(_ sender: CustomButton) {
    }
    
    /// 意識いいえボタン
    @IBAction func consciousnessNoButton(_ sender: CustomButton) {
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

