//
//  FamilySettingViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/18.
//

import UIKit

/// 家族設定画面
final class FamilySettingViewController: UIViewController {
    
    // MARK: - Properties
    
    private let dataModel = FamilySettingDataModel(childName: "",
                                                   detail: "",
                                                   family: "",
                                                   familyLineage: .mama)
    private let sections = ["お子さま一覧", "管理家族一覧"]
    private var childrenList: [[String: String]] = []
    private var familyList: [[String: String]] = []
    private var datePicker: UIDatePicker?
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
        configureTableView()
        navigationItem.title = "家族設定"
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
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // カスタムセル1
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCell")
        // カスタムセル2
        let nib2 = UINib(nibName: "AddListTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "AddListTableViewCell")
    }
    
    /// テーブルビューを更新
    private func updateTableViewData() {
        tableView.reloadData()
    }
    
    /// 追加画面に遷移
    private func moveToFamilyInputVC(title: String, placeholder: String) {
        let familyInputVC = FamilyInputViewController()
        familyInputVC.setData(title: title, placeholder: placeholder)
        familyInputVC.delegate = self
        let navi = UINavigationController(rootViewController: familyInputVC)
        navi.modalPresentationStyle = .formSheet
        navigationController?.present(navi, animated: true)
    }
}

// MARK: - Extentions

extension FamilySettingViewController: UITableViewDataSource {
    /// セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    /// セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 各セクションの行数を返す。最後の行を含むため+1しています。
        return (section == 0) ? childrenList.count + 1 : familyList.count + 1
    }
    
    /// セクションを設定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    /// セルを設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            // 最後の行の場合
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddListTableViewCell", for: indexPath) as! AddListTableViewCell
            // ハイライトを消す
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setup(labelText: (indexPath.section == 0) ? "+お子さまを追加する" : "+家族を招待する")
            return cell
        } else {
            // 通常のデータを表示するセル
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
            let data = (indexPath.section == 0) ? childrenList[indexPath.row] : familyList[indexPath.row]
            // ハイライトを消す
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setup(name: data["name"] ?? "", detail: data["detail"] ?? "")
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension FamilySettingViewController: UITableViewDelegate {
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
        return 60
    }
    
    /// セルがタップされたときに実行したいアクション
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath) is AddListTableViewCell {
            if indexPath.section == 0 {
                moveToFamilyInputVC(title: "お子さまを追加", placeholder: "生年月日を入力")
            } else {
                moveToFamilyInputVC(title: "家族を招待", placeholder: "続柄を選択")
            }
        }
    }
    
    /// スワイプした時に表示するアクションの定義
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt trailingSwipeActionsConfigurationForRowAtindexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 編集処理
        let editAction = UIContextualAction(style: .normal, title: "編集") {(action, view, completionHandler) in
            
            // 実行結果に関わらず記述
            completionHandler(true)
        }
        
        // 削除処理
        let deleteAction = UIContextualAction(style: .destructive, title: "削除") {(action, view, completionHandler) in
            
            // 実行結果に関わらず記述
            completionHandler(true)
        }
        
        // 定義したアクションをセット
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}

// MARK: - FamilyInputViewControllerDelegate

extension FamilySettingViewController: FamilyInputViewControllerDelegate {
    
    func didSelectChildren(list: [String : String]) {
        childrenList.append(list)
        updateTableViewData()
    }
    
    func didSelectFamily(list: [String : String]) {
        familyList.append(list)
        updateTableViewData()
    }
}
