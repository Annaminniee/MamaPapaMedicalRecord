//
//  FamilyManagementListTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/19.
//

import UIKit

final class FamilyManagementListTableViewCell: UITableViewCell {

    @IBOutlet private weak var familyNameLabel: UILabel!
    @IBOutlet private weak var relationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(familyname: String, relation: String) {
        familyNameLabel.text = familyname
        relationLabel.text = relation
    }
}
