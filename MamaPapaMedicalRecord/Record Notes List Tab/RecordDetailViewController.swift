//
//  RecordDetailViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

///  記録ノート詳細画面
final class RecordDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録対象者
    @IBOutlet private weak var recordPersonTextField: UITextField!
    /// 記録期間
    @IBOutlet private weak var recordPeriodTextField: UITextField!
    /// メモ一覧
    @IBOutlet private weak var memoTableView: UITableView!
    /// 受診記録
    @IBOutlet weak var consultationTableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
        configurePrintButtonItem()
        navigationItem.title = ""
        setupTapGestureRecognizer()
    }
    
    // MARK: - Other Methods
    
    /// 戻るボタンの設定
    private func configureCancelButtonItem() {
        let cancelButton = UIBarButtonItem(title: "<戻る",
                                           style: .plain,
                                           target: self,
                                           action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func backButtonTapped() {
        // 前の画面に戻る
        navigationController?.popViewController(animated: true)
    }
    
    private func configurePrintButtonItem() {
        let printButton = UIBarButtonItem(image: UIImage(named: "printIcon"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(printButtonTapped))
        navigationItem.rightBarButtonItem = printButton
    }
    
    @objc func printButtonTapped() {
        // TODO: プリント処理
    }
    
    /// タップジェスチャーリコグナイザをセットアップ
    private func setupTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    /// 画面のどこかをタップしてキーボードを閉じるメソッド
    @objc private func handleTap() {
        view.endEditing(true)
    }
}

