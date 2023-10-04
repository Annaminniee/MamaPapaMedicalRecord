//
//  VomitingViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// メモ画面_嘔吐画面
final class VomitingViewController: UIViewController {
    
    // MARK: - Properties
    
    /// FirebaseServiceのインスタンス
    let firebaseService = FirebaseService.shared
    
    /// UIDatePickerのインスタンス
    private let datePicker = UIDatePicker()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    /// ユーザーID
    private var userID: String = ""
    /// 下痢の有無
    private var isVomiting: Bool = false
    /// 頭を打ったかどうか
    private var isHitHead: Bool = false
    /// 喘息の有無
    private var isAsthma: Bool = false
    
    // MARK: - IBOutlets
    
    /// 記録日時
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// メモ
    @IBOutlet private weak var textView: PlaceHolderTextView!
    /// 画像挿入
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
        configureDatePicker()
        configureCancelButtonItem()
        configureSaveButtonItem()
        navigationItem.title = "嘔吐"
        setupTapGestureRecognizer()
        textView.placeHolder = "入力してください"
    }
    
    // MARK: - IBActions
    
    /// 下痢「はい」ボタンをタップ
    @IBAction private func tapDiarrheaYesButton(_ sender: CustomButton) {
    }
    /// 下痢「なし」ボタンをタップ
    @IBAction private func tapDiarrheaNoButton(_ sender: CustomButton) {
    }
    /// 頭を打った「はい」ボタンをタップ
    @IBAction private func tapHitHeadYesButton(_ sender: CustomButton) {
    }
    /// 頭を打った「いいえ」ボタンをタップ
    @IBAction private func tapHitHeadNoButton(_ sender: CustomButton) {
    }
    /// 喘息「あり」ボタンをタップ
    @IBAction private func tapAsthmaYesButton(_ sender: CustomButton) {
    }
    /// 喘息「なし」ボタンをタップ
    @IBAction private func tapAsthmaNoButton(_ sender: CustomButton) {
    }
    /// 写真挿入ボタンをタップ
    @IBAction private func tapPhotoButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
        self.present(picker, animated: true)
    }
    /// カメラ・動画記入ボタンをタップ
    @IBAction func tapCameraButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        // UIImagePickerController カメラを起動する
        present(picker, animated: true, completion: nil)
    }
    /// 削除ボタンをタップ
    @IBAction func tapTrashButton(_ sender: UIButton) {
    }
    
    // MARK: - Other Methods
    
    func setData(userID: String) {
        self.userID = userID
    }
    
    /// 閉じるボタンの設定
    private func configureCancelButtonItem() {
        let cancelButton = UIBarButtonItem(title: "閉じる",
                                           style: .plain,
                                           target: self,
                                           action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    /// 閉じるボタンをタップ
    @objc func backButtonTapped() {
        // 前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
    /// 登録ボタンの設定
    private func configureSaveButtonItem() {
        let saveButton = UIBarButtonItem(title: "登録",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    /// 登録ボタンをタップ
    @objc func saveButtonTapped() {
        isValidData()
    }
    
    /// バリデーション
    private func isValidData() {
        if recordDateTextField.text != "",
           temperatureTextField.text != "",
           textView.text != "",
           let image = imageView.image {
            // 先に画像をアップロードします
            uploadImage(image: image)
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
    
    /// 日付ピッカーの設定
    private func configureDatePicker() {
        // UITextFieldのキーボードをDatePickerに設定
        recordDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self,
                             action: #selector(datePickerValueChanged(_:)),
                             for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        recordDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    /// ツールバーの設定
    private func configureToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "決定",
                                         style: .done,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        let cancelButton = UIBarButtonItem(title: "キャンセル",
                                           style: .plain,
                                           target: self,
                                           action: #selector(toolBarCancelButtonTapped))
        
        toolbar.setItems([cancelButton,
                          UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil),
                          doneButton],
                         animated: false)
        
        recordDateTextField.inputAccessoryView = toolbar
    }
    
    /// 「決定」をタップ時
    @objc func doneButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月d日HH時mm分"
        recordDateTextField.text = dateFormatter.string(from: datePicker.date)
        // ピッカーを閉じる
        recordDateTextField.resignFirstResponder()
    }
    
    /// 「キャンセル」をタップ時
    @objc func toolBarCancelButtonTapped() {
        // ピッカーを閉じる
        recordDateTextField.resignFirstResponder()
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
    
    /// 画像をアップロード
    private func uploadImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        let imageFileName = "vomiting.jpg"
        let imagePath = "images/\(userID)/\(imageFileName)"
        
        firebaseService.uploadImageToStorage(imageData: imageData,
                                             path: imagePath) { (url, error) in
            if let error = error {
                print("データの保存エラー: \(error)")
            } else if let url = url {
                // URL型からString型に変換
                let imageUrlString = url.absoluteString
                // アップロードが成功したらデータを保存します
                self.saveData(imageURL: imageUrlString)
            }
        }
    }
    
    /// Firestoreにデータを保存
    private func saveData(imageURL: String) {
        
        guard let recordDate = recordDateTextField.text,
              let temperature = temperatureTextField.text,
              let memo = textView.text else { return }
        
        let data: [String: Any] = [
            "recordDate": recordDate,
            "isVomiting": isVomiting,
            "temperature": temperature,
            "isHitHead": isHitHead,
            "isAsthma": isAsthma,
            "memo": memo,
            "imageURL": imageURL
        ]
        
        firebaseService.saveDataToFirestore(collection: "vomiting", data: data) { error in
            if let error = error {
                print("データの保存エラー: \(error)")
            } else {
                print("データが正常に保存されました")
                // 前の画面に戻る
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

// MARK: - UIImagePickerControllerDelegate

extension VomitingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}
