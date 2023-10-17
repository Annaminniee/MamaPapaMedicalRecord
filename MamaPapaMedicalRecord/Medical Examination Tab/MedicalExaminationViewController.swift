//
//  MedicalExaminationViewController.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/08.
//

import UIKit

/// 受診画面
final class MedicalExaminationViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// 記録ノート名設定
    @IBOutlet private weak var recordNoteNameTextField: UITextField!
    /// 記録日時設定
    @IBOutlet private weak var recordDateTextField: UITextField!
    /// 病院名設定
    @IBOutlet private weak var hospitalNameTextField: UITextField!
    /// 先生からのコメント設定
    @IBOutlet private weak var textView: UITextView!
    /// 処方箋画像設定
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "受診"
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
    }
    
    // MARK: - Other Methods
    private func configureSaveButtonItem() {
        let saveButton = UIBarButtonItem(title: "登録",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonTapped() {
        // TODO: 保存処理
    }
}

// MARK: - UIImagePickerControllerDelegate

extension MedicalExaminationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
