//
//  RecordTitleModel.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/05.
//

import UIKit

struct RecordTitleModel {
    var recordDate: Date    // 記録日時
    var symptoms: Symptoms  // 症状
    
    init(data: [String: Any]) {
        self.recordDate = data["record_date"] as? Date ?? Date()
        self.symptoms = data["symptoms"] as? Symptoms ?? .fever
    }
}

/// 症状の種別
enum Symptoms: String {
    case fever =  "熱"
    case convulsions = "下痢"
    case vomiting = "嘔吐"
    case diarrhea =  "痙攣"
    case rash = "発疹"
    case other = "その他"
}
