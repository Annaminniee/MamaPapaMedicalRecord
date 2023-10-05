//
//  MemoViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

/// メモ画面
final class MemoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var recordNameTextField: UITextField!
    @IBOutlet private weak var sleepHourTextField: UITextField!
    @IBOutlet private weak var sleepMinuteTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "症状"
        configureDatePicker()
        configureTableView()
        setupTapGestureRecognizer()
    }
    
    // MARK: - Other Methods
    
    /// 日付ピッカーの設定
    private func configureDatePicker() {
        // DatePickerのモードを日付のみに設定
        datePicker.datePickerMode = .date
        // DatePickerの初期値を設定（任意）
        datePicker.date = Date()
        // DatePickerの値が変更されたときに呼ばれるアクションを設定
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    /// DatePickerの値が変更されたときに呼ばれるメソッド
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        // 選択された日付をTextFieldに表示
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // 日付フォーマットを適宜変更
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        //カスタムセル
        let nib = UINib(nibName: "CoverTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CoverTableViewCell")
    }
    
    // MARK: - IBActions
    
    /// 熱ボタンをタップ
    @IBAction private func tapFeverButton(_ sender: CustomButton) {
        let nextVC = FeverViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 下痢ボタンをタップ
    @IBAction private func tapDiarrheaButton(_ sender: CustomButton) {
        let nextVC = DiarrheaViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 嘔吐ボタンをタップ
    @IBAction private func tapVomitingButton(_ sender: CustomButton) {
        let nextVC = VomitingViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 痙攣ボタンをタップ
    @IBAction private func tapConvulsionButton(_ sender: CustomButton) {
        let nextVC = ConvulsionsViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 発疹ボタンをタップ
    @IBAction private func tapRashButton(_ sender: CustomButton) {
        let nextVC = RashViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// その他ボタンをタップ
    @IBAction private func tapOtherButton(_ sender: CustomButton) {
        let nextVC = OtherViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 食欲普通ボタンをタップ
    @IBAction private func tapAppetiteNormal(_ sender: CustomButton) {
    }
    
    /// 食欲少しボタンをタップ
    @IBAction private func tapAppetiteLittleButton(_ sender: CustomButton) {
    }
    
    /// 食欲なしボタンをタップ
    @IBAction private func tapAppetiteNoButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できたボタンをタップ
    @IBAction private func tapHydrationYesButton(_ sender: CustomButton) {
    }
    
    /// 水分補給少しボタンをタップ
    @IBAction private func tapHydrationLittleButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できないボタンをタップ
    @IBAction private func tapHydrationNoButton(_ sender: CustomButton) {
    }
    
    /// 機嫌良いボタンをタップ
    @IBAction private func tapMoodGoodButton(_ sender: CustomButton) {
    }
    
    /// 機嫌普通ボタンをタップ
    @IBAction private func tapMoodNormalButton(_ sender: CustomButton) {
    }
    
    /// 機嫌悪いボタンをタップ
    @IBAction private func tapMoodBadButton(_ sender: CustomButton) {
    }
    
    /// 機嫌ぐったりボタンをタップ
    @IBAction private func tapMoodTiredButton(_ sender: CustomButton) {
    }
    
    /// 睡眠多いボタンをタップ
    @IBAction private func tapSleepMuchButton(_ sender: CustomButton) {
    }
    
    /// 睡眠普通ボタンをタップ
    @IBAction private func tapSleepNormalButton(_ sender: CustomButton) {
    }
    
    /// 睡眠少ないボタンをタップ
    @IBAction private func tapSleepLittleButton(_ sender: CustomButton) {
    }
    
    /// 睡眠寝てないボタンをタップ
    @IBAction private func tapSleepNoButton(_ sender: CustomButton) {
    }
    
    /// 咳ありボタンをタップ
    @IBAction private func tapCoughYesButton(_ sender: CustomButton) {
    }
    
    /// 咳なしボタンをタップ
    @IBAction private func tapCoughNoButton(_ sender: CustomButton) {
    }
    
    /// 鼻水ありボタンをタップ
    @IBAction private func tapSnotYesButton(_ sender: CustomButton) {
    }
    
    /// 鼻水なしボタンをタップ
    @IBAction private func tapSnotNoButton(_ sender: CustomButton) {
    }
    
    // MARK: - Other Methods
    
    private func configureSaveButtonItem() {
        let saveButton = UIBarButtonItem(title: "保存",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonTapped() {
        // TODO: 保存処理
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

// MARK: - UITextFieldDelegate

extension MemoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        recordNameTextField.resignFirstResponder()
        return true
    }
}

// MARK: - UITableViewDataSource

extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoverTableViewCell", for: indexPath)as! CoverTableViewCell
        cell.setup(memo: "あああ")
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MemoViewController: UITableViewDelegate {
    /// セルの高さを設定するメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    // スワイプした時に表示するアクションの定義
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 編集処理
        let editAction = UIContextualAction(style: .normal, title: "編集") { (action, view, completionHandler) in
            // 編集処理を記述
            print("編集がタップされた")
            
            // 実行結果に関わらず記述
            completionHandler(true)
        }
        
        // 削除処理
        let deleteAction = UIContextualAction(style: .destructive, title: "削除") { (action, view, completionHandler) in
            //削除処理を記述
            print("削除がタップされた")
            
            // 実行結果に関わらず記述
            completionHandler(true)
        }
        
        // 定義したアクションをセット
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
