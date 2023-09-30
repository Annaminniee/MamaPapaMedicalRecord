//
//  MemoViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

/// メモ画面
final class MemoViewController: UIViewController {
    
    //変数を宣言する
    //今日の日付を代入
    let nowDate = NSDate()
    let dateFormat = DateFormatter()
    let inputDatePicker = UIDatePicker()
    
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
        recordNameTextField.delegate = self
        
        //日付フィールドの設定
        dateFormat.dateFormat = "yyyy年MM月dd日"
        dateTextField.text = dateFormat.string(from: nowDate as Date)
        self.dateTextField.delegate = self
        
        // DatePickerの設定(日付用)
        inputDatePicker.datePickerMode = UIDatePicker.Mode.date
        dateTextField.inputView = inputDatePicker
        
        // キーボードに表示するツールバーの表示
        let pickerToolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        pickerToolBar.barStyle = UIBarStyle.black
        pickerToolBar.tintColor = UIColor.white
        pickerToolBar.backgroundColor = UIColor.black
        
        //ボタンの設定
        //右寄せのためのスペース設定
        let spaceBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,target: self,action: Selector(""))
        
        //完了ボタンを設定
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .done, target: self, action: Selector(("toolBarBtnPush:")))
        
        //ツールバーにボタンを表示
        pickerToolBar.items = [spaceBarBtn,toolBarBtn]
        dateTextField.inputAccessoryView = pickerToolBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //完了を押すとピッカーの値を、テキストフィールドに挿入して、ピッカーを閉じる
    func toolBarBtnPush(sender: UIBarButtonItem){
        var pickerDate = inputDatePicker.date
        dateTextField.text = dateFormat.string(from: pickerDate)
        self.view.endEditing(true)
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
}
