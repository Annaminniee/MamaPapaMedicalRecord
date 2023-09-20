//
//  ChildrenListTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/19.
//

import UIKit

final class ListTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(name: String, detail: String) {
        nameLabel.text = name
        detailLabel.text = detail
    }
}
