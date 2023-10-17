//
//  MemoViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

/// メモ画面
final class MemoViewController: UIViewController {
    
    // MARK: - Properties
    
    /// FirebaseServiceのインスタンス
    let firebaseService = FirebaseService.shared
    
    private var id: String = ""
    /// 食欲
    private var appetite: Appetite?
    /// 水分補給
    private var hydration: Hydration?
    /// 機嫌
    private var mood: Mood?
    /// 睡眠
    private var sleepQuantity: SleepQuantity?
    /// 咳
    private var cough: Bool = false
    /// 鼻水
    private var snot: Bool = false
    
    // MARK: - IBOutlets
    
    /// 日にち入力
    @IBOutlet private weak var dateTextField: UITextField!
    /// DatePicker入力
    @IBOutlet private weak var datePicker: UIDatePicker!
    /// 記録ノート名入力
    @IBOutlet private weak var recordNameTextField: UITextField!
    /// 熱ボタン
    @IBOutlet private weak var feverButton: CustomButton!
    /// 下痢ボタン
    @IBOutlet private weak var diarrheaButton: CustomButton!
    /// 嘔吐ボタン
    @IBOutlet private weak var vomitingButton: CustomButton!
    /// 痙攣ボタン
    @IBOutlet private weak var convulsionsButton: CustomButton!
    /// 発疹ボタン
    @IBOutlet private weak var rashButton: CustomButton!
    /// その他ボタン
    @IBOutlet private weak var otherButton: CustomButton!
    /// 食欲「普通」ボタン
    @IBOutlet private weak var appetiteUsualButton: CustomButton!
    /// 食欲「少し」ボタン
    @IBOutlet private weak var appetiteLittleButton: CustomButton!
    /// 食欲「なし」ボタン
    @IBOutlet private weak var appetiteNoneButton: CustomButton!
    /// 水分補給「できた」ボタン
    @IBOutlet private weak var hydrationDoneButton: CustomButton!
    /// 水分補給「少し」ボタン
    @IBOutlet private weak var hydrationLittleButton: CustomButton!
    /// 水分補給「できない」ボタン
    @IBOutlet private weak var hydrationNotDoneButton: CustomButton!
    /// 機嫌「良い」ボタン
    @IBOutlet private weak var moodGoodButton: CustomButton!
    /// 機嫌「普通」ボタン
    @IBOutlet private weak var moodNormalButton: CustomButton!
    /// 機嫌「悪い」ボタン
    @IBOutlet private weak var moodBadButton: CustomButton!
    /// 機嫌「ぐったり」ボタン
    @IBOutlet private weak var moodLimpButton: CustomButton!
    /// 睡眠「多い」ボタン
    @IBOutlet private weak var sleepNumerousButton: CustomButton!
    /// 睡眠「普通」ボタン
    @IBOutlet private weak var sleepUsualButton: CustomButton!
    /// 睡眠「少ない」ボタン
    @IBOutlet private weak var sleeplessButton: CustomButton!
    /// 睡眠「寝てない」ボタン
    @IBOutlet private weak var sleepNotSleepingButton: CustomButton!
    /// 睡眠（時間）
    @IBOutlet private weak var sleepHourTextField: UITextField!
    /// 睡眠（分）
    @IBOutlet private weak var sleepMinuteTextField: UITextField!
    /// 鼻水「あり」ボタン
    @IBOutlet private weak var snotYesButton: CustomButton!
    /// 鼻水「なし」ボタン
    @IBOutlet private weak var snotNoButton: CustomButton!
    /// 咳「あり」ボタン
    @IBOutlet private weak var coughYesButton: CustomButton!
    /// 咳「なし」ボタン
    @IBOutlet private weak var coughNoButton: CustomButton!
    /// メモ一覧
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
    
    func setData(id: String) {
        self.id = id
    }
    
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
        appetiteUsualButton.backgroundColor = .white
        appetiteLittleButton.backgroundColor = .lightGray
        appetiteNoneButton.backgroundColor = .lightGray
        self.appetite = .usual
    }
    
    /// 食欲少しボタンをタップ
    @IBAction private func tapAppetiteLittleButton(_ sender: CustomButton) {
        appetiteUsualButton.backgroundColor = .lightGray
        appetiteLittleButton.backgroundColor = .white
        appetiteNoneButton.backgroundColor = .lightGray
        self.appetite = .little
    }
    
    /// 食欲なしボタンをタップ
    @IBAction private func tapAppetiteNoButton(_ sender: CustomButton) {
        appetiteUsualButton.backgroundColor = .lightGray
        appetiteLittleButton.backgroundColor = .lightGray
        appetiteNoneButton.backgroundColor = .white
        self.appetite = .none
    }
    
    /// 水分補給できたボタンをタップ
    @IBAction private func tapHydrationYesButton(_ sender: CustomButton) {
        hydrationDoneButton.backgroundColor = .white
        hydrationLittleButton.backgroundColor = .lightGray
        hydrationNotDoneButton.backgroundColor = .lightGray
        self.hydration = .done
    }
    
    /// 水分補給少しボタンをタップ
    @IBAction private func tapHydrationLittleButton(_ sender: CustomButton) {
        hydrationDoneButton.backgroundColor = .lightGray
        hydrationLittleButton.backgroundColor = .white
        hydrationNotDoneButton.backgroundColor = .lightGray
        self.hydration = .little
    }
    
    /// 水分補給できないボタンをタップ
    @IBAction private func tapHydrationNoButton(_ sender: CustomButton) {
        hydrationDoneButton.backgroundColor = .lightGray
        hydrationLittleButton.backgroundColor = .lightGray
        hydrationNotDoneButton.backgroundColor = .white
        self.hydration = .notDone
    }
    
    /// 機嫌良いボタンをタップ
    @IBAction private func tapMoodGoodButton(_ sender: CustomButton) {
        moodGoodButton.backgroundColor = .white
        moodNormalButton.backgroundColor = .lightGray
        moodBadButton.backgroundColor = .lightGray
        moodLimpButton.backgroundColor = .lightGray
        self.mood = .good
    }
    
    /// 機嫌普通ボタンをタップ
    @IBAction private func tapMoodNormalButton(_ sender: CustomButton) {
        moodGoodButton.backgroundColor = .lightGray
        moodNormalButton.backgroundColor = .white
        moodBadButton.backgroundColor = .lightGray
        moodLimpButton.backgroundColor = .lightGray
        self.mood = .normal
    }
    
    /// 機嫌悪いボタンをタップ
    @IBAction private func tapMoodBadButton(_ sender: CustomButton) {
        moodGoodButton.backgroundColor = .lightGray
        moodNormalButton.backgroundColor = .lightGray
        moodBadButton.backgroundColor = .white
        moodLimpButton.backgroundColor = .lightGray
        self.mood = .bad
    }
    
    /// 機嫌ぐったりボタンをタップ
    @IBAction private func tapMoodTiredButton(_ sender: CustomButton) {
        moodGoodButton.backgroundColor = .lightGray
        moodNormalButton.backgroundColor = .lightGray
        moodBadButton.backgroundColor = .lightGray
        moodLimpButton.backgroundColor = .white
        self.mood = .limp
    }
    
    /// 睡眠多いボタンをタップ
    @IBAction private func tapSleepMuchButton(_ sender: CustomButton) {
        sleepNumerousButton.backgroundColor = .white
        sleepUsualButton.backgroundColor = .lightGray
        sleeplessButton.backgroundColor = .lightGray
        sleepNotSleepingButton.backgroundColor = .lightGray
        self.sleepQuantity = .numerous
    }
    
    /// 睡眠普通ボタンをタップ
    @IBAction private func tapSleepNormalButton(_ sender: CustomButton) {
        sleepNumerousButton.backgroundColor = .lightGray
        sleepUsualButton.backgroundColor = .white
        sleeplessButton.backgroundColor = .lightGray
        sleepNotSleepingButton.backgroundColor = .lightGray
        self.sleepQuantity = .usual
    }
    
    /// 睡眠少ないボタンをタップ
    @IBAction private func tapSleepLittleButton(_ sender: CustomButton) {
        sleepNumerousButton.backgroundColor = .lightGray
        sleepUsualButton.backgroundColor = .lightGray
        sleeplessButton.backgroundColor = .white
        sleepNotSleepingButton.backgroundColor = .lightGray
        self.sleepQuantity = .less
    }
    
    /// 睡眠寝てないボタンをタップ
    @IBAction private func tapSleepNoButton(_ sender: CustomButton) {
        sleepNumerousButton.backgroundColor = .lightGray
        sleepUsualButton.backgroundColor = .lightGray
        sleeplessButton.backgroundColor = .lightGray
        sleepNotSleepingButton.backgroundColor = .white
        self.sleepQuantity = .notSleeping
    }
    
    /// 鼻水ありボタンをタップ
    @IBAction private func tapSnotYesButton(_ sender: CustomButton) {
        snotYesButton.backgroundColor = .white
        snotNoButton.backgroundColor = .lightGray
        self.snot = true
    }
    
    /// 鼻水なしボタンをタップ
    @IBAction private func tapSnotNoButton(_ sender: CustomButton) {
        snotYesButton.backgroundColor = .lightGray
        snotNoButton.backgroundColor = .white
        self.snot = true
    }
    
    /// 咳ありボタンをタップ
    @IBAction private func tapCoughYesButton(_ sender: CustomButton) {
        coughYesButton.backgroundColor = .white
        coughNoButton.backgroundColor = .lightGray
        self.cough = true
    }
    
    /// 咳なしボタンをタップ
    @IBAction private func tapCoughNoButton(_ sender: CustomButton) {
        coughYesButton.backgroundColor = .lightGray
        coughNoButton.backgroundColor = .white
        self.cough = true
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
        isValidData()
    }
    
    /// バリデーション
    private func isValidData() {
        if dateTextField.text != "",
           recordNameTextField.text != "",
           appetite != nil,
           hydration != nil,
           mood != nil,
           sleepQuantity != nil,
           sleepHourTextField.text != "",
           sleepMinuteTextField.text != "" {
            saveData()
        } else {
            showAlert(title: "項目をすべて入力してください", message: "")
        }
    }
    
    /// アラートを表示
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
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
    
    /// Firestoreにデータを保存
    private func saveData() {
        
        guard let recordDate = dateTextField.text,
              let recordName = recordNameTextField.text,
              let sleepHour = sleepHourTextField.text,
              let sleepMinute = sleepMinuteTextField.text else { return }
        
        let data: [String: Any] = [
            "recordDate": recordDate,
            "recordName": recordName,
            "appetite": appetite ?? .usual,
            "hydration": hydration ?? .done,
            "mood": mood ?? .good,
            "sleepQuantity": sleepQuantity ?? .numerous,
            "sleepHour": sleepHour,
            "sleepMinute": sleepMinute,
            "snot": snot,
            "cough": cough,
        ]
        
        firebaseService.saveDataToFirestore(collection: "memoList", data: data) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                print("データの保存エラー: \(error)")
                self.showAlert(title: "保存に失敗しました", message: "")
            } else {
                print("データが正常に保存されました")
            }
        }
        // 前の画面に戻る
        self.dismiss(animated: true, completion: nil)
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
        cell.setup(memo: "")
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
