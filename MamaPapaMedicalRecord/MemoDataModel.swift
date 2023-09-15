//
//  MemoDataModel.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/14.
//

import UIKit

struct MemoDataModel {
    var id: String
    var recordDate: Date     // 記録日時
    var temperature: String  // 熱
    var appetite: Appetite   // 食欲
    var hydration: Hydration // 水分補給
    var mood: Mood           // 機嫌
    var sleepQuantity: SleepQuantity // 睡眠
    var sleepingTime: String // 睡眠時間
    var cough: Bool          // 咳
    var snot: Bool           // 鼻水
    var memo: String         // メモ
    
    init(id: String, data: [String: Any]) {
        self.id = id
        self.recordDate = data["record_date"] as? Date ?? Date()
        self.temperature = data["temperature"] as? String ?? ""
        self.appetite = data["appetite"] as? Appetite ?? .usually
        self.hydration = data["hydration"] as? Hydration ?? .done
        self.mood = data["mood"] as? Mood ?? .normal
        self.sleepQuantity = data["sleep_quantity"] as? SleepQuantity ?? .usual
        self.sleepingTime = data["sleeping_time"] as? String ?? ""
        self.cough = data["cough"] as? Bool ?? false
        self.snot = data["snot"] as? Bool ?? false
    }
}

/// 食欲の種別
enum Appetite: String {
    case usually =  "普通"
    case little = "少し"
    case none = "なし"
}

/// 水分補給の種別
enum Hydration: String {
    case done = "できた"
    case little = "少し"
    case notDone = "できない"
}

/// 機嫌の種別
enum Mood: String {
    case good = "良い"
    case Bad = "悪い"
    case normal = "普通"
    case limp = "ぐったり"
}

/// 睡眠量の種別
enum SleepQuantity: String {
    case numerous = "多い"
    case usual = "普通"
    case less = "少ない"
    case notSleeping = "寝てない"
}
