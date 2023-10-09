//
//  RecordNotesListViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

/// 記録一覧ノートtableviewセル
final class RecordNotesListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "記録ノート一覧"
        configureTableView()
    }
        
    // MARK: - Other Methods
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        //カスタムセル
        let nib = UINib(nibName: "CoverTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CoverTableViewCell")
    }
    @IBAction func addTapButton(_ sender: UIButton) {
        let nextVC = RecordDetailViewController()
                navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension RecordNotesListViewController: UITableViewDataSource {
    /// データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoverTableViewCell", for: indexPath)as! CoverTableViewCell
        cell.setup(date: "xxx", memo: "あああ")
        return cell
    }
}

// MARK: - UITableViewDelegate

extension RecordNotesListViewController: UITableViewDelegate {
    /// セルの高さを設定するメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
