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
    /// 場所「その他」設定
    @IBOutlet private weak var placeOtherTextField: UITextField!
    /// メモ設定
    @IBOutlet private weak var textView: UITextView!
    /// 画像設定
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem() 
        configureSaveButtonItem()
        navigationItem.title = "発疹"
    }
    
    // MARK: - IBActions
    
    /// 場所：頭ボタン
    @IBAction private func tapHeadButton(_ sender: CustomButton) {
    }
    /// 場所：顔ボタン
    @IBAction private func tapFaceButton(_ sender: CustomButton) {
    }
    /// 場所：首ボタン
    @IBAction private func tapNeckButton(_ sender: CustomButton) {
    }
    /// 場所：お腹ボタン
    @IBAction private func tapStomachButton(_ sender: CustomButton) {
    }
    /// 場所：背中ボタン
    @IBAction private func tapBackButton(_ sender: CustomButton) {
    }
    /// 場所：股ボタン
    @IBAction private func tapCrotchButton(_ sender: CustomButton) {
    }
    /// 場所：お尻ボタン
    @IBAction private func tapHipButton(_ sender: CustomButton) {
    }
    /// 場所：足ボタン
    @IBAction private func tapLegButton(_ sender: CustomButton) {
    }
    /// 場所：その他ボタン
    @IBAction func tapOtherButton(_ sender: UIButton) {
    }
    /// 画像挿入ボタン
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
