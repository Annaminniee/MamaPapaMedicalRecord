//
//  FamilySettingViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/18.
//

import UIKit

/// 家族設定画面
final class FamilySettingViewController: UIViewController {

    // MARK: - IBOutlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
    }

    /// 戻るボタンの設定
    func configureCancelButtonItem() {
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
}
