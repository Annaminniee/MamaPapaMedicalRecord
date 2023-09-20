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
        tableView.tableFooterView = UIView()
        // カスタムセル
        let nib = UINib(nibName: "ListTableViewCell, AddListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCell, AddListTableViewCell")
    }
    
    let familySettingDataModel = FamilySettingDataModel(name: "", detail: "", list: "")
}

// MARK: - Extentions

extension FamilySettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)as! ListTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "AddListTableViewCell", for: indexPath)as! AddListTableViewCell
        cell1.setup(name: "あああ", detail: "あああ")
        cell2.setup(labelText: "あああ")
        return cell1; cell2
    }
}
