//
//  CoverTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/13.
//

import UIKit

final class CoverTableViewCell: UITableViewCell {

    @IBOutlet private weak var memoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup(memo: String) {
        memoLabel.text = memo
    }
    
}
