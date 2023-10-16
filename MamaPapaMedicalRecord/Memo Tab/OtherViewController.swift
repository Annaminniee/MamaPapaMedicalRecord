//
//  OtherViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// メモ画面_その他画面
final class OtherViewController: UIViewController {
    
    // MARK: - Properties
    
    /// FirebaseServiceのインスタンス
    let firebaseService = FirebaseService.shared
    
    /// UIDatePickerのインスタンス
    private let datePicker = UIDatePicker()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    /// ユーザーID
    private var userID: String = ""
    
    // MARK: - IBOutlets
    
    /// 記録日時設定
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温設定
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// メモ設定
    @IBOutlet private weak var textView: PlaceHolderTextView!
    /// 画像設定
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
        configureDatePicker()
        configureCancelButtonItem()
        configureSaveButtonItem()
        navigationItem.title = "その他"
        setupTapGestureRecognizer()
        textView.placeHolder = "入力してください"
    }
    
    // MARK: - IBActions
    
    /// 写真挿入ボタンをタップ
    @IBAction private func tapPhotoButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
        self.present(picker, animated: true)
    }
    /// カメラ・動画起動ボタンをタップ
    @IBAction private func tapCameraButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        // UIImagePickerController カメラを起動する
        present(picker, animated: true, completion: nil)
    }
    /// 削除ボタンをタップ
    @IBAction private func tapTrashButton(_ sender: UIButton) {
        imageView.image = nil
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
    
    /// 登録ボタンを設定
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
        datePicker.datePickerMode = .dateAndTime
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
        let imageFileName = "other.jpg"
        let imagePath = "images/\(imageFileName)"
        
        firebaseService.uploadImageToStorage(imageData: imageData,
                                             path: imagePath) { [weak self] (url, error) in
            guard let self = self else { return }
            if let error = error {
                print("データの保存エラー: \(error)")
                self.showAlert(title: "保存に失敗しました", message: "")
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
            "temperature": temperature,
            "memo": memo,
            "imageURL": imageURL
        ]
        
        firebaseService.saveDataToFirestore(collection: "other", data: data) { [weak self] error in
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

// MARK: - UIImagePickerControllerDelegate

extension OtherViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
