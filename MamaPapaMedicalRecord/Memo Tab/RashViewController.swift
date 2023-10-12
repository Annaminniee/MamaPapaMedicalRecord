//
//  RashViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/25.
//

import UIKit

/// メモ画面_発疹画面
final class RashViewController: UIViewController {
    
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
    /// 発疹
    private var site: Site?
    
    struct Rash {
        var site: Site // 場所
        
        init(data: [String: Any]) {
            self.site = data["site"] as? Site ?? .head
        }
    }
    ////  発疹の場所
    enum Site: String {
        case head = "頭"
        case face = "顔"
        case neck = "首"
        case stomach = "お腹"
        case back = "背中"
        case crotch = "股"
        case hip = "お尻"
        case leg = "足"
        case other = "その他"
    }
    
    // MARK: - IBOutlets
    
    /// 記録日時設定
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 体温設定
    @IBOutlet private weak var temperatureTextField: UITextField!
    /// 頭ボタン
    @IBOutlet private weak var headButton: CustomButton!
    /// 顔ボタン
    @IBOutlet private weak var faceButton: CustomButton!
    /// 首ボタン
    @IBOutlet private weak var neckButton: CustomButton!
    /// お腹ボタン
    @IBOutlet private weak var stomachButton: CustomButton!
    /// 背中ボタン
    @IBOutlet private weak var backButton: CustomButton!
    /// 股ボタン
    @IBOutlet private weak var crotchButton: CustomButton!
    /// お尻ボタン
    @IBOutlet private weak var hipButton: CustomButton!
    /// 足ボタン
    @IBOutlet private weak var legButton: CustomButton!
    /// その他ボタン
    @IBOutlet private weak var otherButton: UIButton!
    /// 場所「その他」設定
    @IBOutlet private weak var otherTextField: UITextField!
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
        navigationItem.title = "発疹"
        setupTapGestureRecognizer()
        textView.placeHolder = "入力してください"
    }
    
    // MARK: - IBActions
    
    /// 場所：頭ボタンをタップ
    @IBAction private func tapHeadButton(_ sender: CustomButton) {
        headButton.backgroundColor = .white
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .lightGray
        self.site = .head
    }
    /// 場所：顔ボタンをタップ
    @IBAction private func tapFaceButton(_ sender: CustomButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .white
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .lightGray
        self.site = .face
    }
    /// 場所：首ボタンをタップ
    @IBAction private func tapNeckButton(_ sender: CustomButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .white
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .lightGray
        self.site = .neck
    }
    /// 場所：お腹ボタンをタップ
    @IBAction private func tapStomachButton(_ sender: CustomButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .white
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .lightGray
        self.site = .stomach
    }
    /// 場所：背中ボタンをタップ
    @IBAction private func tapBackButton(_ sender: CustomButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .white
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .lightGray
        self.site = .back
    }
    /// 場所：股ボタンをタップ
    @IBAction private func tapCrotchButton(_ sender: CustomButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .white
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .lightGray
        self.site = .crotch
    }
    /// 場所：お尻ボタンをタップ
    @IBAction private func tapHipButton(_ sender: CustomButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .white
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .lightGray
        self.site = .hip
    }
    /// 場所：足ボタンをタップ
    @IBAction private func tapLegButton(_ sender: CustomButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .white
        otherButton.backgroundColor = .lightGray
        self.site = .leg
    }
    /// 場所：その他ボタンをタップ
    @IBAction private func tapOtherButton(_ sender: UIButton) {
        headButton.backgroundColor = .lightGray
        faceButton.backgroundColor = .lightGray
        neckButton.backgroundColor = .lightGray
        stomachButton.backgroundColor = .lightGray
        backButton.backgroundColor = .lightGray
        crotchButton.backgroundColor = .lightGray
        hipButton.backgroundColor = .lightGray
        legButton.backgroundColor = .lightGray
        otherButton.backgroundColor = .white
        self.site = .other
    }
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
    
    /// 戻るボタンの設定
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
        let imageFileName = "rash.jpg"
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
              let other = otherTextField,
              let memo = textView.text else { return }
        
        let data: [String: Any] = [
            "recordDate": recordDate,
            "temperature": temperature,
            "site": Site.self,
            "other": other,
            "memo": memo,
            "imageURL": imageURL
        ]
        
        firebaseService.saveDataToFirestore(collection: "rash", data: data) { [weak self] error in
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

extension RashViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
