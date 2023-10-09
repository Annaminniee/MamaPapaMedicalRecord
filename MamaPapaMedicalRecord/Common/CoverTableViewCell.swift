//
//  CoverTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/13.
//

import UIKit

final class CommonTableViewCell: UITableViewCell {

    @IBOutlet private weak var memoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(memo: String) {
        memoLabel.text = memo
    }
    
}
