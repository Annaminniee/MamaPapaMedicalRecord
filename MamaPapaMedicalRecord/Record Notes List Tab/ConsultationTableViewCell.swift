//
//  ConsultationTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/09.
//

import UIKit

class ConsultationTableViewCell: UITableViewCell {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(date: String, detail: String) {
        dateLabel.text = date
        detailLabel.text = detail
    }
    
}
