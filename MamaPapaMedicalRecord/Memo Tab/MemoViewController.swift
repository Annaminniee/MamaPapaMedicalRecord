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
        setDismissKeyboard()
        configureTableView()
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
    
    /// 熱ボタン
    @IBAction private func feverButton(_ sender: CustomButton) {
        let nextVC = FeverViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 下痢ボタン
    @IBAction private func diarrheaButton(_ sender: CustomButton) {
        let nextVC = DiarrheaViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 嘔吐ボタン
    @IBAction private func vomitingButton(_ sender: CustomButton) {
        let nextVC = VomitingViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 痙攣ボタン
    @IBAction private func convulsionButton(_ sender: CustomButton) {
        let nextVC = ConvulsionsViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 発疹ボタン
    @IBAction private func rashButton(_ sender: CustomButton) {
        let nextVC = RashViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// その他ボタン
    @IBAction private func otherButton(_ sender: CustomButton) {
        let nextVC = OtherViewController()
        let navi = UINavigationController(rootViewController: nextVC)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    /// 食欲普通ボタン
    @IBAction private func appetiteNormal(_ sender: CustomButton) {
    }
    
    /// 食欲少しボタン
    @IBAction private func appetiteLittleButton(_ sender: CustomButton) {
    }
    
    /// 食欲なしボタン
    @IBAction private func appetiteNoButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できたボタン
    @IBAction private func hydrationYesButton(_ sender: CustomButton) {
    }
    
    /// 水分補給少しボタン
    @IBAction private func hydrationLittleButton(_ sender: CustomButton) {
    }
    
    /// 水分補給できないボタン
    @IBAction private func hydrationNoButton(_ sender: CustomButton) {
    }
    
    /// 機嫌良いボタン
    @IBAction private func moodGoodButton(_ sender: CustomButton) {
    }
    
    /// 機嫌普通ボタン
    @IBAction private func moodNormalButton(_ sender: CustomButton) {
    }
    
    /// 機嫌悪いボタン
    @IBAction private func moodBadButton(_ sender: CustomButton) {
    }
    
    /// 機嫌ぐったりボタン
    @IBAction private func moodTiredButton(_ sender: CustomButton) {
    }
    
    /// 睡眠多いボタン
    @IBAction private func sleepMuchButton(_ sender: CustomButton) {
    }
    
    /// 睡眠普通ボタン
    @IBAction private func sleepNormalButton(_ sender: CustomButton) {
    }
    
    /// 睡眠少ないボタン
    @IBAction private func sleepLittleButton(_ sender: CustomButton) {
    }
    
    /// 睡眠寝てないボタン
    @IBAction private func sleepNoButton(_ sender: CustomButton) {
    }
    
    /// 咳ありボタン
    @IBAction private func coughYesButton(_ sender: CustomButton) {
    }
    
    /// 咳なしボタン
    @IBAction private func coughNoButton(_ sender: CustomButton) {
    }
    
    /// 鼻水ありボタン
    @IBAction private func snotYesButton(_ sender: CustomButton) {
    }
    
    /// 鼻水なしボタン
    @IBAction private func snotNoButton(_ sender: CustomButton) {
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
        // 保存処理
    }
}

// MARK: - UITextFieldDelegate

extension MemoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        recordNameTextField.resignFirstResponder()
        return true
    }
    
    func setDismissKeyboard() {
            let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapGR.cancelsTouchesInView = false
            self.view.addGestureRecognizer(tapGR)
        }
        
        @objc func dismissKeyboard() {
            self.view.endEditing(true)
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
}
