//
//  CustomButton.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/23.
//

import UIKit

class CustomButton: UIButton {
    @IBInspectable var borderColor: UIColor = UIColor.clear // 枠線の色
    @IBInspectable var borderWidth: CGFloat = 0.0 // 枠線の太さ
    @IBInspectable var cornerRadius: CGFloat = 0.0 // 枠線の角丸
    
    override func draw(_ rect: CGRect) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        super.draw(rect)
    }
}
