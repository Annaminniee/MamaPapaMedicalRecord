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
    @IBOutlet private weak var recordDateTextField: UITextField!
    @IBOutlet private weak var temperatureTextField: UITextField!
    @IBOutlet private weak var memoTableView: UITableView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var cameraImageView: UIImageView!
    @IBOutlet private weak var trashImageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "熱"
    }
    
    // MARK: - IBActions
    
    @IBAction func antipyreticAgentYesButton(_ sender: CustomButton) {
    }
    @IBAction func antipyreticAgentNoButton(_ sender: CustomButton) {
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
