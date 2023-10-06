//
//  RecordNotesListTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/05.
//

import UIKit

/// 記録一覧ノートtableviewの実装
final class RecordNotesListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var recordNotesListLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(list: String) {
       recordNotesListLabel.text = list
    }
}
