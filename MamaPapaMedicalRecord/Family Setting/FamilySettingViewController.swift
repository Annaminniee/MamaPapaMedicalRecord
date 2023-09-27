//
//  FamilySettingViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/18.
//

import UIKit
import Firebase

/// 家族設定画面
final class FamilySettingViewController: UIViewController {
    
    // MARK: - Properties
    
    /// FIRFirestoreインスタンス
    private let db = Firestore.firestore()
    /// セクションのタイトル
    private let sections = ["お子さま一覧", "管理家族一覧"]
    private var childrenList: [Child] = []
    private var familyList: [Family] = []
    private var datePicker: UIDatePicker?
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
        configureTableView()
        navigationItem.title = "家族設定"
        fetchData()
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
    
    private func configureTableView() {
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
    
    /// Firestoreからデータを取得
    private func fetchData() {
        /// お子さま一覧を取得
        db.collection("children").getDocuments { [weak self] (querySnapshot, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching child documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let documentID = document.documentID
                    if let data = document.data() as? [String: String],
                       let childName = data["childName"],
                       let birthday = data["birthday"] {
                        let child = Child(documentID: documentID, childName: childName, birthday: birthday)
                        childrenList.append(child)
                    }
                }
                print("Children: \(childrenList)")
                tableView.reloadData()
            }
        }
        
        /// 家族一覧を取得
        db.collection("families").getDocuments { [weak self] (querySnapshot, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching family documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let documentID = document.documentID
                    if let data = document.data() as? [String: String],
                       let familyName = data["familyName"],
                       let familyLineage = data["familyLineage"] {
                        let family = Family(documentID: documentID, family: familyName, familyLineage: familyLineage)
                        self.familyList.append(family)
                    }
                }
                print("Families: \(familyList)")
                tableView.reloadData()
            }
        }
    }
    
    /// Firestoreからデータを再取得
    private func updateData() {
        // 二重になるので一旦削除
        childrenList.removeAll()
        familyList.removeAll()
        
        fetchData()
    }
    
    /// データを削除
    private func deleteData(indexPath: IndexPath) {
        var collection: FamilySettingCollection
        var documentID = ""
        if indexPath.section == 0 {
            collection = .children
            documentID = childrenList[indexPath.row].documentID
            childrenList.remove(at: indexPath.row)
        } else {
            collection = .families
            documentID = familyList[indexPath.row].documentID
            familyList.remove(at: indexPath.row)
        }
        
        let docRef = db.collection(collection.rawValue).document(documentID)
        docRef.delete { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated")
            }
        }
        tableView.reloadData()
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
            // ハイライトを消す
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            if indexPath.section == 0 {
                let data = childrenList[indexPath.row]
                cell.setup(name: data.childName ?? "", detail: data.birthday ?? "")
            } else {
                let data = familyList[indexPath.row]
                cell.setup(name: data.family ?? "", detail: data.familyLineage ?? "")
            }
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
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "削除") { [weak self] (action,
                                                                          view,
                                                                          completionHandler) in
            guard let self = self else { return }
            self.deleteData(indexPath: trailingSwipeActionsConfigurationForRowAtindexPath)
            completionHandler(true)
        }
        
        // 定義したアクションをセット
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}

// MARK: - FamilyInputViewControllerDelegate

extension FamilySettingViewController: FamilyInputViewControllerDelegate {
    
    /// お子さまを追加した時
    func didSelectChildren() {
        updateData()
    }
    
    /// 家族を追加した時
    func didSelectFamily() {
        updateData()
    }
}
