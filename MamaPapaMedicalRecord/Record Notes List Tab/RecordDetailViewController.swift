//
//  RecordDetailViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit
import SwiftUI

///  記録ノート詳細画面
final class RecordDetailViewController: UIViewController {
    
    // MARK: - Properties
       
       private let sections = ["メモ一覧", "受診記録"]
       private let memoList = ["memo": "あああ"]
       private let consultationList = ["detail": "かかか"]
    
    // MARK: - IBOutlets
    
    /// 記録対象者
    @IBOutlet private weak var recordPersonTextField: UITextField!
    /// 記録期間
    @IBOutlet private weak var recordPeriodTextField: UITextField!
    /// メモ一覧・受診記録
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
        configurePrintButtonItem()
        navigationItem.title = ""
        setupTapGestureRecognizer()
        configureTableView()
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
    
    /// 戻るボタンをタップ
    @objc func backButtonTapped() {
        // 前の画面に戻る
        navigationController?.popViewController(animated: true)
    }
    
    /// プリントボタンの設定
    private func configurePrintButtonItem() {
        let printButton = UIBarButtonItem(image: UIImage(named: "printIcon"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(printButtonTapped))
        navigationItem.rightBarButtonItem = printButton
    }
    
    /// プリントボタンをタップ
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
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // カスタムセル
        let nib = UINib(nibName: "ConsultationTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ConsultationTableViewCell")
    }
}

// MARK: - Extentions

extension RecordDetailViewController: UITableViewDataSource {
    /// セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    /// セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 各セクションの行数を返す。
        return (section == 0) ? memoList.count : consultationList.count
    }
    
    /// セクションを設定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    /// セルを設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // データを表示するセル
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationTableViewCell", for: indexPath) as! RecordDetailTableViewCell
        cell.setup(consultation: "ああああああああああああああああああああああああああああ", selectedImage: UIImage())
        return cell
    }
}
// MARK: - UITableViewDelegate

extension RecordDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray // セクションヘッダーの背景色を設定
        
        let label = UILabel()
        label.text = sections[section] // セクションのタイトルを設定
        label.textColor = UIColor.black // テキストの色を設定
        label.font = UIFont.systemFont(ofSize: 12) // フォントサイズを12に設定
        
        // ラベルをヘッダービューに追加
        headerView.addSubview(label)
        
        // Auto Layoutを使用してラベルを配置
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    /// セルの高さを設定するメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /// セルをタップされた時のメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがタップされたときに実行したいアクションをここに追加します
        // indexPathを使用して選択されたセルの情報にアクセスできます
        
        // 例: タップされたセルのテキストをコンソールに表示
        let cell = tableView.cellForRow(at: indexPath)
        if let text = cell?.textLabel?.text {
            print("Selected cell text: \(text)")
        }
        
        // 他のアクションを実行することも可能
    }
}
