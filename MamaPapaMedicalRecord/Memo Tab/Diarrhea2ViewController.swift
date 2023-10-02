//
//  Diarrhea2ViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

final class Diarrhea2ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録日時設定
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温設定
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// その他設定
    @IBOutlet private weak var otherTextField: UITextField!
    /// におい設定
    @IBOutlet private weak var smellTextField: UITextField!
    /// メモ設定
    @IBOutlet private weak var memoTableView: UITableView!
    /// 画像挿入設定
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
        configureSaveButtonItem()
        navigationItem.title = "下痢"
    }
    
    // MARK: - IBActions
    
    /// 形軟便ボタン
    @IBAction private func tapSoftButton(_ sender: CustomButton) {
    }
    /// 形泥状ボタン
    @IBAction func tapMudButton(_ sender: CustomButton) {
    }
    /// 形水様ボタン
    @IBAction func tapLiquidButton(_ sender: CustomButton) {
    }
    /// 形黄色ボタン
    @IBAction func tapYellowButton(_ sender: CustomButton) {
    }
    /// 形白色ボタン
    @IBAction func tapWhiteButton(_ sender: CustomButton) {
    }
    /// 形黒色ボタン
    @IBAction func tapBlackButton(_ sender: CustomButton) {
    }
    /// 写真挿入ボタン
    @IBAction func tapPhotoButton(_ sender: UIButton) {
    }
    /// カメラ・動画起動ボタン
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
