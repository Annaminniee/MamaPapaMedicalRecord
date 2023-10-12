//
//  RecordDetailTableViewCell.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/09.
//

import UIKit
import SwiftUI

final class RecordDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var consultationLabel: UILabel!
    @IBOutlet private weak var prescriptionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(consultation: String, selectedImage: UIImage) {
        consultationLabel.text = consultation
        prescriptionImageView.image = selectedImage
    }
}
