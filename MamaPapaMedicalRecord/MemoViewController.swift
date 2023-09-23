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
    @IBOutlet private weak var recordNameTextField: UITextField!
    @IBOutlet private weak var feverButton: CustomButton!
    @IBOutlet private weak var diarrheaButton: CustomButton!
    @IBOutlet private weak var vomitingButton: CustomButton!
    @IBOutlet private weak var convulsionsButton: CustomButton!
    @IBOutlet private weak var rashButton: CustomButton!
    @IBOutlet private weak var otherButton: CustomButton!
    @IBOutlet private weak var appetiteNormalButton: CustomButton!
    @IBOutlet private weak var appetiteLittleButton: CustomButton!
    @IBOutlet private weak var appetiteNoButton: CustomButton!
    @IBOutlet private weak var hydrationYesButton: CustomButton!
    @IBOutlet private weak var hydrationLittleButton: CustomButton!
    @IBOutlet private weak var hydrationNoButton: CustomButton!
    @IBOutlet private weak var moodGoodButton: CustomButton!
    @IBOutlet private weak var moodNormalButton: CustomButton!
    @IBOutlet private weak var moodBadButton: CustomButton!
    @IBOutlet private weak var moodTiredButton: CustomButton!
    @IBOutlet private weak var sleepMuchButton: CustomButton!
    @IBOutlet private weak var sleepNormalButton: CustomButton!
    @IBOutlet private weak var sleepLittleButton: CustomButton!
    @IBOutlet private weak var sleepNoButton: CustomButton!
    @IBOutlet private weak var sleepHourTextField: UITextField!
    @IBOutlet private weak var sleepMinuteButton: UITextField!
    @IBOutlet private weak var coughYesButton: CustomButton!
    @IBOutlet private weak var coughNoButton: CustomButton!
    @IBOutlet private weak var snotYesButton: CustomButton!
    @IBOutlet private weak var snotNoButton: CustomButton!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSaveButtonItem()
        navigationItem.title = "症状"
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
