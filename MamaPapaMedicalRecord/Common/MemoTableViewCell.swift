//
//  TableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/01.
//

import UIKit

final class MemoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var memoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(memo: String) {
        memoLabel.text = memo
    }
}
