//
//  ConsultationTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/09.
//

import UIKit

final class ConsultationTableViewCell: UITableViewCell {

    @IBOutlet private weak var consultationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(consultation: String) {
        consultationLabel.text = consultation
    }
    
}
